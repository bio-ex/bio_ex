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
    ...>Enum.map(dna, &(&1))
    ["t", "t", "a", "g", "c", "t"]

    iex>dna = Bio.Sequence.DnaStrand.new("ttagct")
    ...>Enum.slice(dna, 2, 2)
    %Bio.Sequence.DnaStrand{sequence: "ag", length: 2, label: ""}

  """
  use Bio.SimpleSequence
end

defmodule Bio.Sequence.Dna do
  alias Bio.Sequence.DnaStrand

  defstruct top_strand: DnaStrand.new("", length: 0),
            bottom_strand: DnaStrand.new("", length: 0),
            complement_offset: 0
end
