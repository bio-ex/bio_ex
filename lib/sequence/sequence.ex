defmodule Bio.Sequence do
  @moduledoc """
  `Bio.Sequence` is the basic building block of the sequence types.

  The core concept here is that a polymer is a sequence of elements encoded as a
  binary. This is stored in the base `%Bio.Sequence{}` struct, which has both a
  `sequence` and `length` field, and may carry a `label` as well.

  The struct is intentionally sparse on information since this is meant to
  compose into larger data types. For example, the `Bio.Sequence.DnaDoubleStrand` struct,
  which has two polymer `Bio.Sequence.DnaStrand`s as the `top_strand` and
  `bottom_strand` fields.

  Because many of the sequence behaviors are shared, they are implemented by
  `Bio.SimpleSequence` and used in the modules that need them. This allows us to
  ensure that there is a consistent implementation of the `Enumerable` protocol,
  which in turn allows for common interaction patterns a la Python strings:

  # Examples
      iex>sequence = Bio.Sequence.new("agmctbo")
      ...>Enum.map(sequence, &(&1))
      ["a", "g", "m", "c", "t", "b", "o"]

      iex>sequence = Bio.Sequence.new("agmctbo")
      iex>"gmc" in sequence
      true

      iex>sequence = Bio.Sequence.new("agmctbo")
      iex>Enum.slice(sequence, 2, 2)
      %Bio.Sequence{sequence: "mc", length: 2, label: ""}

  My hope is that this alleviates some of the pain of coming from a language
  where strings are slightly more complex objects.
  """
  use Bio.SimpleSequence

  defmodule Conversions do
    use Bio.Behaviors.Converter
  end

  @impl Bio.Behaviors.Sequence
  def converter, do: Conversions
end
