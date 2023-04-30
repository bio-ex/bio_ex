defmodule Bio.Sequence.Rna do
  alias Bio.Sequence.DnaStrand

  defmodule Conversions do
    def to(DnaStrand), do: {:ok, &to_dna/1}
    def to(_), do: {:error, :undef_conversion}

    def to_dna("a"), do: "a"
    def to_dna("u"), do: "t"
    def to_dna("g"), do: "g"
    def to_dna("c"), do: "c"
  end
end
