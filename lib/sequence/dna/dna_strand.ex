defmodule Bio.Sequence.DnaStrand do
  @moduledoc """
  A single DNA strand can be represented by the basic sequence which uses
  `Bio.SimpleSequence` .

  # Examples
      iex>"tagc" in DnaStrand.new("ttagct")
      true

      iex>alias Bio.Enum, as: Bnum
      ...>DnaStrand.new("ttagct")
      ...>|> Bnum.map(&(&1))
      %DnaStrand{sequence: "ttagct", length: 6}

      iex>alias Bio.Enum, as: Bnum
      ...>DnaStrand.new("ttagct")
      ...>|> Bnum.slice(2, 2)
      %DnaStrand{sequence: "ag", length: 2, label: ""}


  In order to validate the sequence of nucleotides, you can pass an alphabet  to
  the `valid?/2` function.
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
