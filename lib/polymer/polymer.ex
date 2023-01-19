defmodule Bio.Polymer do
  @moduledoc """
  This module houses the functions that act on biological polymers.

  Each polymer type is defined as it's own module with a related struct for the
  polymer definition, while there is a general `Bio.Polymer` struct for things
  that are not necessarily known (e.g. input from a FASTA file).

  These structs are meant to enable niche work on edge cases related to the
  specific properties of those polymers. For example, `Bio.Polymer.Dna` is
  represented as a `top` and `bottom` strand, with offsets. This allows you to
  do things with DNA that has sticky ends, for example.

  The `Bio.Polymer` is intended to be the workhorse of the module. This is why
  IO defaults to using it.

  The `Bio.Polymer` struct is simple. It exposes the sequence and its length, as
  well as an optional label for it. This makes it an ideal target for simple
  linear sequences, like amino acids.

  Because the length is stored on the polymer, the struct implements
  `Enumerable`, allowing you to do some convenient things with it.

  # Examples
    iex>import Enum
    iex>poly = Bio.Polymer.from_binary("ttagcgctctcatga", [])
    iex>"ttagcg" in poly
    true
    iex>"not here" in poly
    false
    iex>comp = %{"t" => "a", "a" => "t", "g" => "c", "c" => "g"}
    iex>map(poly, fn nt -> Map.get(comp, nt) end) |> join()
    "aatcgcgagagtact"
    iex>chunk_every(poly, 3) |> map(&join/1)
    ["tta", "gcg", "ctc", "tca", "tga"]

  """
  alias __MODULE__, as: Self
  alias Bio.Polymer.{Dna, Rna, AminoAcid}

  defstruct sequence: "", length: 0, label: ""

  @doc """
  Take a polymer to another type, e.g. `Bio.Polymer` -> `Bio.Polymer.Dna`

  ## Examples

      iex> polymer = Bio.Polymer.from_binary("ttaggct")
      iex>Bio.Polymer.to(polymer, :dna)
      %Bio.Polymer.Dna{
        top: "ttaggct",
        bottom: "aatccga",
        bottom_length: 7,
        top_length: 7,
        offset: 0,
        overhangs: %Bio.Polymer.Overhangs{
          top_left: "",
          top_right: "",
          bottom_left: "",
          bottom_right: ""
        },
        orientation: {5, 3},
        label: ""
      }

  Handles changes between types as well, so you can do

      iex>dna = Bio.Polymer.Dna.from_binary("atgcttgcagt")
      iex>Bio.Polymer.to(dna, :rna)
      %Bio.Polymer.Rna{
        top: "augcuugcagu",
        bottom: "uacgaacguca",
        bottom_length: 11,
        top_length: 11,
        offset: 0,
        overhangs: %Bio.Polymer.Overhangs{
          top_left: "",
          top_right: "",
          bottom_left: "",
          bottom_right: ""
        },
        orientation: {5, 3},
        label: ""
      }
  """
  def to(struct, type, opts \\ [])

  def to(%Self{sequence: seq, label: label, length: len}, :dna, _opts) do
    Bio.Polymer.Dna.from_binary(seq,
      label: label,
      length: len
    )
  end

  def to(%Self{sequence: seq, label: label, length: len}, :rna, opts) do
    Bio.Polymer.Rna.from_binary(seq,
      label: label,
      length: len,
      alphabet: Keyword.get(opts, :alphabet)
    )
  end

  def to(%Dna{} = dna, :rna, _opts) do
    Dna.to(dna, :rna)
  end

  def from_binary(poly, opts \\ []) when is_binary(poly) do
    length = Keyword.get(opts, :length, nil) || String.length(poly)
    label = Keyword.get(opts, :label, "")

    %Self{sequence: poly, length: length, label: label}
  end

  @doc """
  A utility function for performing a conversion between strings using a given
  function
  """
  def convert(binary, mapping_fn, index \\ 0)

  def convert(<<char::binary-size(1), rest::binary>>, mapping_fn, index) do
    concat(mapping_fn.(char), convert(rest, mapping_fn, index + 1), index)
  end

  def convert(<<>>, _mapping_fn, _index) do
    {:ok, ""}
  end

  defp concat({:ok, char1}, {:ok, char2}, _index) do
    char1 <> char2
  end

  defp concat({:error, msg1}, {:error, msg2}, index) do
    {:error, "#{msg1} at #{index} and #{msg2}"}
  end

  defp concat({:ok, _}, {:error, msg}, _index) do
    {:error, msg}
  end

  defp concat({:ok, char}, bin, _inex) do
    char <> bin
  end

  defp concat({:error, msg1}, _, index) do
    {:error, "#{msg1} at #{index}"}
  end

  defimpl Enumerable do
    def reduce(poly, acc, fun) do
      do_reduce(to_str_list(poly.sequence), acc, fun)
    end

    defp do_reduce(_, {:halt, acc}, _fun), do: {:halted, acc}
    defp do_reduce(list, {:suspend, acc}, fun), do: {:suspended, acc, &do_reduce(list, &1, fun)}
    defp do_reduce([], {:cont, acc}, _fun), do: {:done, acc}
    defp do_reduce([h | t], {:cont, acc}, fun), do: do_reduce(t, fun.(h, acc), fun)

    defp to_str_list(obj) when is_binary(obj) do
      obj
      |> String.to_charlist()
      |> Enum.map(&<<&1>>)
    end

    defp to_str_list(%Bio.Polymer{sequence: obj}) do
      obj
      |> String.to_charlist()
      |> Enum.map(&<<&1>>)
    end

    def member?(poly, element) when is_binary(element) do
      element_len = String.length(element)

      cond do
        poly.length < element_len -> {:ok, false}
        poly.length == element_len -> {:ok, poly.sequence == element}
        poly.length > element_len -> check(poly.sequence, element_len, element)
      end
    end

    defp check(<<bin::binary>>, size, element) do
      <<chunk::binary-size(size), _::binary>> = bin
      <<_::binary-size(1), rest::binary>> = bin

      cond do
        chunk == element ->
          {:ok, true}

        true ->
          cond do
            String.length(rest) >= size -> check(rest, size, element)
            true -> {:ok, false}
          end
      end
    end

    defp check(<<>>, _size, _element) do
      {:ok, false}
    end

    def count(poly) do
      {:ok, poly.length}
    end

    def slice(poly) do
      {:ok, poly.length,
       fn start, amount, _step ->
         <<_before::binary-size(start), chunk::binary-size(amount), _rest::binary>> =
           poly.sequence

         Bio.Polymer.from_binary(chunk, length: amount)
       end}
    end
  end
end
