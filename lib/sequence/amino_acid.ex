defmodule Bio.Sequence.AminoAcid do
  @moduledoc """
  Amino acids are modeled as simple sequences using `Bio.Sequence`.

  This module doesn't implement any validations, since those are not well
  defined in every case. For example, it may be valid to contain ambiguous
  nucleotides, or it may not. Since that depends on the use, this is left to
  applications developers to write.

  # Examples
    iex>aa = Bio.Sequence.AminoAcid.new("ymabagta")
    ...>"mabag" in aa
    true

    iex>aa = Bio.Sequence.AminoAcid.new("ymabagta")
    ...>Enum.map(aa, &(&1))
    ["y", "m", "a", "b", "a", "g", "t", "a"]

    iex>aa = Bio.Sequence.AminoAcid.new("ymabagta")
    ...>Enum.slice(aa, 2, 2)
    %Bio.Sequence.AminoAcid{sequence: "ab", length: 2, label: ""}

  """
  use Bio.SimpleSequence

  defmodule DefaultConversions do
    def to(_), do: {:error, :undef_conversion}
  end
end

defimpl Bio.Protocols.Convertible, for: Bio.Sequence.AminoAcid do
  alias Bio.Sequence.{AminoAcid, DnaStrand, DnaDoubleStrand, RnaStrand, RnaDoubleStrand}

  def convert(%AminoAcid{} = amino, DnaStrand, converter) do
    amino
    |> Enum.map(converter)
    |> Enum.join()
    |> DnaStrand.new(label: amino.label)
  end
end
