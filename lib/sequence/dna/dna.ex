defmodule Bio.Sequence.Dna do
  alias Bio.Sequence.{DnaStrand, RnaStrand, RnaDoubleStrand}
  alias Bio.Behaviours.Converter
  alias Bio.Enum, as: Bnum

  import Bio.Sequence.Utilities, only: [upper?: 1]

  @complement %{
    "a" => "t",
    "A" => "T",
    "t" => "a",
    "T" => "A",
    "g" => "c",
    "G" => "C",
    "c" => "g",
    "C" => "G"
  }

  defmodule Conversions do
    @moduledoc """
    Default conversion definition used by the `Bio.Sequence.DnaStrand` and
    `Bio.Sequence.DnaDoubleStrand` modules.

    The default conversions use conventional nucleotides and map them to their
    relevant RNA nucleotides:

    ```
    a -> a
    t -> u
    g -> g
    c -> c
    ```

    Casing is preserved, so mixed case sequences will not be altered. This
    behavior allows encoding more information in the casing of a sequence than
    merely the structure and is a guarantee of the conversions of this system.
    """
    use Converter do
      def to(RnaStrand), do: {:ok, &to_rna/1}
      def to(RnaDoubleStrand), do: {:ok, &to_rna/1}
    end

    defp to_rna(base) do
      case upper?(base) do
        true ->
          case base do
            "A" -> "A"
            "T" -> "U"
            "G" -> "G"
            "C" -> "C"
          end

        false ->
          case base do
            "a" -> "a"
            "t" -> "u"
            "g" -> "g"
            "c" -> "c"
          end
      end
    end
  end

  def complement(%DnaStrand{} = sequence) do
    sequence
    |> Bnum.map(&Map.get(@complement, &1))
  end

  def complement(sequence) when is_binary(sequence) do
    sequence
    |> String.graphemes()
    |> Enum.map(&Map.get(@complement, &1))
    |> Enum.join()
  end

  def reverse_complement(%DnaStrand{} = sequence) do
    sequence
    |> Bnum.map(&Map.get(@complement, &1))
    |> Bnum.reverse()
  end

  def reverse_complement(sequence) when is_binary(sequence) do
    sequence
    |> String.graphemes()
    |> Enum.map(&Map.get(@complement, &1))
    |> Enum.reverse()
    |> Enum.join()
  end
end
