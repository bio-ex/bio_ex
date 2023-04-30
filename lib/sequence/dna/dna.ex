defmodule Bio.Sequence.Dna do
  defmodule Conversions do
    import Bio.Sequence.Utilities, only: [upper?: 1]

    def to(Bio.Sequence.RnaStrand), do: {:ok, &to_rna/1}
    def to(_), do: {:error, :undef_conversion}

    def to_rna(base) do
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
end
