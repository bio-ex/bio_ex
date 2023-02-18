defmodule Bio.Polymer do
  @moduledoc """
  `Bio.Polymer` is the basic building block of the sequence types.

  The core concept here is that a polymer is a sequence of elements encoded as a
  binary. This is stored in the base `%Bio.Polymer{}` struct, which has both a
  `sequence` and `length` field.

  The struct is intentionally sparse on information since this is meant to
  compose into larger data types. For example, the `Bio.Sequence.Dna` struct,
  which has two polymer `Bio.Sequence.DnaStrand`s as the `top_strand` and
  `bottom_strand` fields.

  Because many of the sequence behaviors are shared, they are implemented by
  `Bio.Sequence` and used in the modules that need them. This allows us to
  ensure that there is a consistent implementation of the `Enumerable` protocol,
  which in turn allows for common interaction patterns a la Python strings:

  # Examples
    iex>polymer = Bio.Polymer.new("agmctbo")
    ...>Enum.map(polymer, &(&1))
    ["a", "g", "m", "c", "t", "b", "o"]

    iex>polymer = Bio.Polymer.new("agmctbo")
    iex>"gmc" in polymer
    true

    iex>polymer = Bio.Polymer.new("agmctbo")
    iex>Enum.slice(polymer, 2, 2)
    %Bio.Polymer{sequence: "mc", length: 2, label: ""}

  My hope is that this alleviates some of the pain of coming from a language
  where strings are slightly more complex objects.
  """
  use Bio.Sequence
end
