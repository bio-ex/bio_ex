defmodule Bio.Sequence.Dna do
  defmodule Conversions do
    def to(Bio.Sequence.RnaStrand), do: {:ok, &to_rna/1}
    def to(_), do: {:error, :undef_converter}

    def to_rna("a"), do: "a"
    def to_rna("t"), do: "u"
    def to_rna("g"), do: "g"
    def to_rna("c"), do: "c"
  end
end
