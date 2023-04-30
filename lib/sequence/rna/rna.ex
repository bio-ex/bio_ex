defmodule Bio.Sequence.Rna do
  @moduledoc """
  `Bio.Sequence.Rna` implements the basic conversions that one expects from RNA
  polymers. Namely, they can by default be converted to the
  `Bio.Sequence.DnaStrand` and `Bio.Sequence.AminoAcid` structs.


  """
  alias Bio.Sequence.DnaStrand

  defmodule Conversions do
    import Bio.Sequence.Utilities, only: [upper?: 1]
    def to(DnaStrand), do: {:ok, &to_dna/1}
    def to(_), do: {:error, :undef_conversion}

    def to_dna(base) do
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
