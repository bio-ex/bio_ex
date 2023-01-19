defmodule Bio.Polymer.Dna do
  @moduledoc """
  This module expresses the logic of dealing with polymers of DNA.

  In general, the assumption is that the data being given to any function is either a
  binary or a struct of the DNA module itself. This is done for ease of use, and
  the `Bio.Polymer.Dna` struct is defined as having a top and bottom strand, with
  an offset for the representation of a non-blunt strand.

  The representation of the polymer is such that you also need an orientation to
  know which end is the 5 prime and which is the 3 prime. The orientation is
  expressed as a tuple of {top, bottom} where the left side of the strand is
  described. Therefore, {5, 3} implies that the left hand side of the top is the
  5 prime end, while the bottom is the 3 prime (the normal configuration).

  Overhangs are represented as a `Bio.Polymer.Overhangs` struct.

  The struct will also carry the top/bottom strand lengths.
  """
  alias __MODULE__, as: Self
  alias Bio.Polymer.Overhangs
  alias Bio.Polymer.{Rna, AminoAcid}

  defstruct top: "",
            bottom: "",
            bottom_length: 0,
            top_length: 0,
            offset: 0,
            overhangs: %Overhangs{},
            orientation: {5, 3},
            label: ""

  @ambiguous_dna ~w(r y s w k m b d h v n)
  @ambiguous_to_codes %{
    "r" => ["a", "g"],
    "y" => ["c", "t"],
    "s" => ["g", "c"],
    "w" => ["a", "t"],
    "k" => ["g", "t"],
    "m" => ["a", "c"],
    "b" => ["c", "g", "t"],
    "d" => ["a", "g", "t"],
    "h" => ["a", "c", "t"],
    "v" => ["a", "c", "g"],
    "n" => ["a", "c", "g", "t"]
  }

  @ambiguous_complments %{
    "b" => "v",
    "d" => "h",
    "h" => "d",
    "k" => "m",
    "m" => "k",
    "n" => "n",
    "r" => "y",
    "s" => "s",
    "v" => "b",
    "w" => "w",
    "y" => "r"
  }
  @code_to_name %{
    "a" => "adenine",
    "c" => "cytosine",
    "g" => "guanine",
    "t" => "thymine"
  }
  @name_to_code %{
    "adenine" => "a",
    "cytosine" => "c",
    "guanine" => "g",
    "thymine" => "t"
  }

  @complement %{
    "a" => "t",
    "c" => "g",
    "g" => "c",
    "t" => "a"
  }

  @dna_to_rna %{
    "a" => "a",
    "c" => "c",
    "g" => "g",
    "t" => "u"
  }

  def dna_to_rna(char) do
    @dna_to_rna
    |> Map.get(char)
    |> case do
      nil -> {:error, "Unable to find matching dna-to-rna for #{char}"}
      other -> {:ok, other}
    end
  end

  @doc """
  Exposes ambiguous DNA codes according to IUPAC
  """
  def ambiguous_dna() do
    @ambiguous_dna
  end

  @doc """
  Mapping nucleotides to their chemical names

  ## Example

      iex> Bio.Polymer.Dna.name("a")
      {:ok, "adenine"}
  """
  def name(char) do
    case Map.get(@code_to_name, char) do
      nil -> {:error, "Unknown nucleotide code #{char}"}
      result -> {:ok, result}
    end
  end

  def code(name) do
    case Map.get(@name_to_code, name) do
      nil -> {:error, "Unknown nucleotide name #{name}"}
      result -> {:ok, result}
    end
  end

  @doc """
  Retrieve the Watson-Crick base pair complement of a given nucleotide
  """
  def wc_complement(char) do
    @complement
    |> Map.get(char)
    |> case do
      nil -> {:error, "Complement can't be made for #{char}"}
      result -> {:ok, result}
    end
  end

  @doc """
  Retrieve the ambiguous OR Watson-Crick base pair complement of a given
  nucleotide, returning error tuple

  # Example
    iex>Bio.Polymer.Dna.ambiguous_complement("n")
    {:ok, "n"}

    iex>Bio.Polymer.Dna.ambiguous_complement("y")
    {:ok, "r"}

    iex>Bio.Polymer.Dna.ambiguous_complement("r")
    {:ok, "y"}

    iex>Bio.Polymer.Dna.ambiguous_complement("k")
    {:ok, "m"}
  """
  def ambiguous_complement(char) do
    @ambiguous_complments
    |> Map.merge(@complement)
    |> Map.get(char)
    |> case do
      nil -> {:error, "Complement can't be made for #{char}"}
      result -> {:ok, result}
    end
  end

  @doc """
  Generate the complement to some DNA.

  This method handles the following data types:
  BitString
  `Bio.Polymer`

  The first two are assumed to be DNA, but this will return an error tuple if
  unknown characters are encountered. The tuple consists of
  {:error, offending_character, index_in_sequence}

  This holds for the simple case of a BitString or a `Bio.Polymer`.

  A complement for a Double Stranded DNA segment is not well defined. Strictly
  speaking, you would be able to access it directly using the `bottom` field of
  the `Bio.Polymer.Dna` struct. However, that's not strictly true, since the
  offset may mean that there are segments that are not represented.

  However, it's impossible to determine then how the user would like this to be
  defined. Are you intending to get the top complement? The top complement
  without the overhangs? With them?

  For that reason, we leave the complement undefined for the `Bio.Polymer.Dna`
  struct itself. You should prefer instead to deal with the `top`, and `bottom`
  binaries of any double stranded DNA that you're working with. This will give
  you the greatest control for your use case.

  # Options
  ambiguous - [boolean] tell the function whether or not ambiguous DNA is to be
  an error or mapped
  """
  def complement(string, opts \\ []) do
    ambiguous? = Keyword.get(opts, :ambiguous, false)

    lookup =
      cond do
        ambiguous? -> &ambiguous_complement/1
        true -> &wc_complement/1
      end

    Bio.Polymer.convert(string, lookup)
  end

  @doc """
  Create a `Bio.Polymer.Dna` struct from a regular binary, O(N) where N is the
  size of the binary.

  Given a binary such as "atgccatgagatcctag", produce a struct with an offset of
  the given value or zero.

  Producing a struct in this way will always produce two even stranded DNA
  objects. It is not possible to use a single strand to define an uneven double
  strand. That can be done using `Bio.Polymer.Dna.from_binaries/2`

  ## Example

      iex> Bio.Polymer.Dna.from_binary("atgccatgagatcctag")
      %Bio.Polymer.Dna{
        top: "atgccatgagatcctag",
        bottom: "tacggtactctaggatc",
        bottom_length: 17,
        top_length: 17,
        overhangs: %Bio.Polymer.Overhangs{top_left: "", top_right: "", bottom_left: "", bottom_right: ""},
        offset: 0,
        orientation: {5, 3},
        label: ""
      }

      iex> Bio.Polymer.Dna.from_binary("atgccatgagatcctag", offset: 3)
      %Bio.Polymer.Dna{
        top: "atgccatgagatcctag",
        bottom: "tacggtactctaggatc",
        overhangs: %Bio.Polymer.Overhangs{top_left: "atg", top_right: "", bottom_left: "", bottom_right: "atc"},
        bottom_length: 17,
        top_length: 17,
        offset: 3,
        orientation: {5, 3},
        label: ""
      }

  Passing in the optional values is done as a map, allowing sane defaults while
  also providing the caller the ability to declare optional values in whatever
  order they please.

      iex> Bio.Polymer.Dna.from_binary("atgccatgagatcctag", label: "my_dna", offset: 5)
      %Bio.Polymer.Dna{
        top: "atgccatgagatcctag",
        bottom: "tacggtactctaggatc",
        bottom_length: 17,
        top_length: 17,
        overhangs: %Bio.Polymer.Overhangs{top_left: "atgcc", top_right: "", bottom_left: "", bottom_right: "ggatc"},
        offset: 5,
        orientation: {5, 3},
        label: "my_dna"
      }
  """
  def from_binary(dna, opts \\ []) do
    offset = Keyword.get(opts, :offset, 0)
    orientation = Keyword.get(opts, :orientation, {5, 3})
    label = Keyword.get(opts, :label, "")
    alphabet = Keyword.get(opts, :alphabet, @complement)
    {bottom, len} = internal_complement(dna, alphabet)

    %Self{
      top: dna,
      bottom: bottom,
      top_length: len,
      bottom_length: len,
      offset: offset,
      overhangs: Overhangs.from({dna, len}, {bottom, len}, offset),
      orientation: orientation,
      label: label
    }
  end

  @doc """
  Generate the reverse complement to a given segment of DNA. Does not perform
  any sort of validation of the DNA.

  ## Example

      iex> Bio.Polymer.Dna.reverse_complement("gatacgt")
      "acgtatc"
  """
  def reverse_complement(dna) when is_binary(dna) do
    dna |> complement() |> String.reverse()
  end

  def reverse_complement(%Bio.Polymer{} = dna) do
    rc = dna.sequence |> complement() |> String.reverse()
    Map.put(dna, :sequence, rc)
  end

  @doc """
  Convert dna to a different type

  # Types
  :rna - converts to `Bio.Polymer.Rna`
  :polymer - converts to two `Bio.Polymer` structs, with {top, bottom} being the
  return
  """
  def to(dna, type, opts \\ [])

  def to(
        %Self{
          top: t,
          bottom: b,
          bottom_length: bl,
          top_length: tl,
          label: l,
          offset: off,
          orientation: orientation,
          overhangs: hangs
        },
        :rna,
        _opts
      ) do
    %Rna{
      top: Bio.Polymer.convert(t, &dna_to_rna/1),
      bottom: Bio.Polymer.convert(b, &dna_to_rna/1),
      bottom_length: bl,
      top_length: tl,
      label: l,
      offset: off,
      orientation: orientation,
      overhangs: hangs
    }
  end

  def to(
        %Self{top: t, bottom: b, top_length: tl, bottom_length: bl, label: l},
        :polymer,
        _opts
      ) do
    {%Bio.Polymer{sequence: t, length: tl, label: l},
     %Bio.Polymer{sequence: b, length: bl, label: l}}
  end

  # used to get a complementary strand as well as the length without duplicating
  # the traversal of the string.
  defp internal_complement(bin_dna, alphabet) do
    bin_dna
    |> String.graphemes()
    |> Enum.reduce({[], 0}, fn char, {str, size} ->
      comp_char = Map.get(alphabet, char)

      # TODO: it would be great if we could tell the user what their alphabet
      # is?
      if is_nil(comp_char),
        do:
          raise(ArgumentError,
            message: "DNA complement for #{char} doesn't exist in the given alphabet"
          )

      {List.insert_at(str, size, Map.get(alphabet, char)), size + 1}
    end)
    |> then(fn {l, s} -> {List.to_string(l), s} end)
  end

  defp swap({el1, el2} = value_set) when is_tuple(value_set) do
    {el2, el1}
  end

  defp swap(%Overhangs{top_right: tr, top_left: tl, bottom_right: br, bottom_left: bl}) do
    %Overhangs{top_left: bl, top_right: br, bottom_right: tr, bottom_left: tl}
  end
end

# TODO: breaks with negative offset, need to be smarter
defimpl String.Chars, for: Bio.Polymer.Dna do
  def to_string(value) do
    "#{value.top}\n#{left_pad(value.bottom, value.offset)}"
  end

  defp left_pad(str, offset) when offset == 0 do
    str
  end

  defp left_pad(str, offset) when offset > 0 do
    left_pad(" #{str}", offset - 1)
  end
end
