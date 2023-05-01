defmodule Bio.Sequence.DnaStrand do
  @moduledoc """
  A single DNA strand can be represented by the basic sequence which uses
  `Bio.SimpleSequence` .

  This module doesn't implement any validations, since those are not well
  defined in every case. For example, it may be valid to contain ambiguous
  nucleotides, or it may not. Since that depends on the use, this is left to
  applications developers to write.

  # Examples
    iex>dna = Bio.Sequence.DnaStrand.new("ttagct")
    ...>"tagc" in dna
    true

    iex>dna = Bio.Sequence.DnaStrand.new("ttagct")
    ...>Bio.Enum.map(dna, &(&1))
    ["t", "t", "a", "g", "c", "t"]

    iex>dna = Bio.Sequence.DnaStrand.new("ttagct")
    ...>Bio.Enum.slice(dna, 2, 2)
    %Bio.Sequence.DnaStrand{sequence: "ag", length: 2, label: ""}

  """
  use Bio.SimpleSequence

  alias Bio.Sequence.Dna.Conversions

  defmodule DefaultConversions do
    def to(value), do: Conversions.to(value)
  end
end

defimpl Bio.Protocols.Convertible, for: Bio.Sequence.DnaStrand do
  alias Bio.Sequence.{DnaStrand, RnaStrand}

  def convert(%DnaStrand{} = sequence, RnaStrand, converter) do
    sequence
    |> Enum.map(converter)
    |> Enum.join("")
    |> RnaStrand.new(label: sequence.label)
  end
end