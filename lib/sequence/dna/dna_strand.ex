defmodule Bio.Sequence.DnaStrand do
  @moduledoc """
  A single DNA strand can be represented by the basic sequence which uses
  `Bio.SimpleSequence` .

  This module doesn't implement any validations, since those are not well
  defined in every case. For example, it may be valid to contain ambiguous
  nucleotides, or it may not. Since that depends on the use, this is left to
  applications developers to write.

  # Examples
    iex>dna = DnaStrand.new("ttagct")
    ...>"tagc" in dna
    true

    iex>alias Bio.Enum, as: Bnum
    ...>dna = DnaStrand.new("ttagct")
    ...>Bnum.map(dna, &(&1))
    %DnaStrand{sequence: "ttagct", length: 6}

    iex>alias Bio.Enum, as: Bnum
    ...>dna = DnaStrand.new("ttagct")
    ...>Bnum.slice(dna, 2, 2)
    %DnaStrand{sequence: "ag", length: 2, label: ""}

  """
  use Bio.SimpleSequence

  @impl Bio.Behaviors.Sequence
  def converter(), do: Bio.Sequence.Dna.Conversions
end

defimpl Bio.Protocols.Convertible, for: Bio.Sequence.DnaStrand do
  alias Bio.Sequence.{DnaStrand, RnaStrand}

  def convert(%DnaStrand{} = sequence, RnaStrand, converter) do
    sequence
    |> Enum.map(converter)
    |> Enum.join("")
    |> RnaStrand.new(label: sequence.label)
  end

  def convert(_, _, _), do: {:error, :undef_conversion}
end
