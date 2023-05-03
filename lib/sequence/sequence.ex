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
      iex>"gmc" in Bio.Sequence.new("agmctbo")
      true

      iex>Bio.Sequence.new("agmctbo")
      ...>|> Enum.map(&(&1))
      ["a", "g", "m", "c", "t", "b", "o"]

      iex>alias Bio.Enum, as: Bnum
      ...>Bio.Sequence.new("agmctbo")
      ...>|> Bnum.slice(2, 2)
      %Bio.Sequence{sequence: "mc", length: 2, label: ""}

  My hope is that this alleviates some of the pain of coming from a language
  where strings are slightly more complex objects.
  """
  use Bio.SimpleSequence

  defmodule Conversions do
    @moduledoc false
    use Bio.Behaviours.Converter
  end

  @impl Bio.Behaviours.Sequence
  def converter, do: Conversions

  @impl Bio.Behaviours.Sequence
  def fasta_line(%__MODULE__{sequence: seq, label: label}), do: ">#{label}\n#{seq}\n"
end
