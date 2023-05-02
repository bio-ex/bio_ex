defmodule Bio.Sequence.Rna do
  @moduledoc """
  `Bio.Sequence.Rna` implements the basic conversions that one expects from RNA
  polymers. Namely, they can by default be converted to the
  `Bio.Sequence.DnaStrand` and `Bio.Sequence.AminoAcid` structs.


  """
  alias Bio.Sequence.{DnaStrand, DnaDoubleStrand}
  alias Bio.Behaviors.Converter
  import Bio.Sequence.Utilities, only: [upper?: 1]

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
end
