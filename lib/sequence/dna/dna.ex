defmodule Bio.Sequence.Dna do
  alias Bio.Sequence.{RnaStrand, RnaDoubleStrand}
  alias Bio.Behaviors.Converter

  import Bio.Sequence.Utilities, only: [upper?: 1]

  defmodule Conversions do
    @moduledoc """
    Default conversion definition used by the `Bio.Sequence.DnaStrand` and
    `Bio.Sequence.DnaDoubleStrand` modules.
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
end
