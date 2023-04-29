defmodule Bio.Sequence.RnaStrand do
  @moduledoc """
  A single RNA strand can be represented by the basic sequence which implements
  the `Bio.Polymer` behavior.

  This module doesn't implement any validations, since those are not well
  defined in every case. For example, it may be valid to contain ambiguous
  nucleotides, or it may not. Since that depends on the use, this is left to
  applications developers to write.

  # Examples
    iex>rna = Bio.Sequence.RnaStrand.new("uuagcu")
    ...>"uagc" in rna
    true

    iex>rna = Bio.Sequence.RnaStrand.new("uuagcu")
    ...>Enum.map(rna, &(&1))
    ["u", "u", "a", "g", "c", "u"]

    iex>rna = Bio.Sequence.RnaStrand.new("uuagcu")
    ...>Enum.slice(rna, 2, 2)
    %Bio.Sequence.RnaStrand{sequence: "ag", length: 2, label: ""}

  """
  use Bio.SimpleSequence
end

defmodule Bio.Sequence.Rna do
  alias Bio.Sequence.RnaStrand

  defstruct top_strand: RnaStrand.new("", length: 0),
            bottom_strand: RnaStrand.new("", length: 0),
            complement_offset: 0
end
