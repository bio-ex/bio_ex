defmodule Bio.Sequence.Rna do
  @moduledoc """
  `Bio.Sequence.Rna` implements the basic conversions that one expects from RNA
  polymers. Namely, they can by default be converted to the
  `Bio.Sequence.DnaStrand` and `Bio.Sequence.AminoAcid` structs.
  """
  alias Bio.Sequence.{RnaStrand, DnaStrand, DnaDoubleStrand}
  alias Bio.Behaviors.Converter
  alias Bio.Enum, as: Bnum
  import Bio.Sequence.Utilities, only: [upper?: 1]

  @complement %{
    "a" => "u",
    "A" => "U",
    "u" => "a",
    "U" => "A",
    "g" => "c",
    "G" => "C",
    "c" => "g",
    "C" => "G"
  }

  defmodule Conversions do
    @moduledoc """
    Default conversions used by the `Bio.Sequence.RnaStrand` and
    `Bio.Sequence.RnaDoubleStrand` modules
    """
    use Converter do
      def to(DnaStrand), do: {:ok, &to_dna/1}
      def to(DnaDoubleStrand), do: {:ok, &to_dna/1}
    end

    defp to_dna(base) do
      case upper?(base) do
        true ->
          case base do
            "A" -> "A"
            "U" -> "T"
            "G" -> "G"
            "C" -> "C"
          end

        false ->
          case base do
            "a" -> "a"
            "u" -> "t"
            "g" -> "g"
            "c" -> "c"
          end
      end
    end
  end

  # TODO: not sure this is how I want this to work, but I _do_ want these
  # semantics.
  def reverse_complement(%RnaStrand{} = sequence) do
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
