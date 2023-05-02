defmodule Bio.Sequence.AminoAcid do
  @moduledoc """
  Amino acids are modeled as simple sequences using `Bio.SimpleSequence`.

  # Examples
      iex>aa = AminoAcid.new("ymabagta")
      ...>"mabag" in aa
      true

      iex>alias Bio.Enum, as: Bnum
      ...>AminoAcid.new("ymabagta")
      ...>|>Bnum.map(&(&1))
      %AminoAcid{sequence: "ymabagta", length: 8}

      iex>alias Bio.Enum, as: Bnum
      ...>AminoAcid.new("ymabagta")
      ...>|>Bnum.slice(2, 2)
      %AminoAcid{sequence: "ab", length: 2, label: ""}

  If you are interested in defining conversions of amino acids then look into
  the `Bio.Sequence.Polymer` module for how to deal with creating a Conversion
  module. The simple `Bio.Sequence.AminoAcid` does define the
  `Bio.Protocols.Convertible` protocol.
  """
  use Bio.SimpleSequence

  defmodule Conversions do
    @moduledoc false
    use Bio.Behaviors.Converter
  end

  @impl Bio.Behaviors.Sequence
  def converter, do: Conversions
end

defimpl Bio.Protocols.Convertible, for: Bio.Sequence.AminoAcid do
  alias Bio.Sequence.{AminoAcid, DnaStrand, RnaStrand}

  def convert(%AminoAcid{} = amino, DnaStrand, converter) do
    amino
    |> Enum.map(converter)
    |> Enum.join()
    |> DnaStrand.new(label: amino.label)
  end

  def convert(%AminoAcid{} = amino, RnaStrand, converter) do
    amino
    |> Enum.map(converter)
    |> Enum.join()
    |> RnaStrand.new(label: amino.label)
  end
end
