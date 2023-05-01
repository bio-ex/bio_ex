defmodule Bio.Sequence.RnaStrand do
  @moduledoc """
  A single RNA strand can be represented by the basic sequence which implements
  the `Bio.Polymer` behavior.

  This module doesn't implement any validations, since those are not well
  defined in every case. For example, it may be valid to contain ambiguous
  nucleotides, or it may not. Since that depends on the use, this is left to
  applications developers to write.

  # Examples
    iex>rna = RnaStrand.new("uuagcu")
    ...>"uagc" in rna
    true

    iex>alias Bio.Enum, as: Bnum
    ...>rna = RnaStrand.new("uuagcu")
    ...>Bnum.map(rna, &(&1))
    %RnaStrand{sequence: "uuagcu", length: 6}

    iex>alias Bio.Enum, as: Bnum
    ...>rna = RnaStrand.new("uuagcu")
    ...>Bnum.slice(rna, 2, 2)
    %RnaStrand{sequence: "ag", length: 2, label: ""}

  """
  use Bio.SimpleSequence
  alias Bio.Sequence.Rna.Conversions

  defmodule DefaultConversions do
    def to(value), do: Conversions.to(value)
  end
end

defimpl Bio.Protocols.Convertible, for: Bio.Sequence.RnaStrand do
  alias Bio.Sequence.{RnaStrand, DnaStrand}

  def convert(%RnaStrand{} = sequence, DnaStrand, converter) do
    sequence
    |> Enum.map(converter)
    |> Enum.join("")
    |> DnaStrand.new(label: sequence.label)
  end
end
