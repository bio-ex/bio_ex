defmodule Bio.Polymer.AminoAcid do
  alias __MODULE__, as: Self

  defstruct sequence: "", length: 0, label: ""

  @name_to_code %{
    "Alanine" => "A",
    "Arginine" => "R",
    "Asparagine" => "N",
    "Aspartic Acid" => "D",
    "Cysteine" => "C",
    "Glutamic Acid" => "E",
    "Glutamine" => "Q",
    "Glycine" => "G",
    "Histidine" => "H",
    "Isoleucine" => "I",
    "Leucine" => "L",
    "Lysine" => "K",
    "Methionine" => "M",
    "Phenylalanine" => "F",
    "Proline" => "P",
    "Serine" => "S",
    "Threonine" => "T",
    "Tryptophan" => "W",
    "Tyrosine" => "Y",
    "Valine" => "V"
  }

  @code_to_name %{
    "A" => "Alanine",
    "R" => "Arginine",
    "N" => "Asparagine",
    "D" => "Aspartic Acid",
    "C" => "Cysteine",
    "E" => "Glutamic Acid",
    "Q" => "Glutamine",
    "G" => "Glycine",
    "H" => "Histidine",
    "I" => "Isoleucine",
    "L" => "Leucine",
    "K" => "Lysine",
    "M" => "Methionine",
    "F" => "Phenylalanine",
    "P" => "Proline",
    "S" => "Serine",
    "T" => "Threonine",
    "W" => "Tryptophan",
    "Y" => "Tyrosine",
    "V" => "Valine"
  }

  def from_binary(sequence_binary, opts \\ []) when is_binary(sequence_binary) do
    length = Keyword.get(opts, :length, String.length(sequence_binary))
    label = Keyword.get(opts, :label, "")
    %Self{sequence: sequence_binary, length: length, label: label}
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

    defp to_str_list(%Self{sequence: obj}) do
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

         Self.from_binary(chunk, length: amount)
       end}
    end
  end
end
