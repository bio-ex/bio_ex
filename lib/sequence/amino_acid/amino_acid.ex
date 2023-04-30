defmodule Bio.Sequence.AminoAcid do
  @moduledoc """
  Amino acids are modeled as simple sequences using `Bio.Sequence`.

  # Examples
    iex>aa = Bio.Sequence.AminoAcid.new("ymabagta")
    ...>"mabag" in aa
    true

    iex>aa = Bio.Sequence.AminoAcid.new("ymabagta")
    ...>Enum.map(aa, &(&1))
    ["y", "m", "a", "b", "a", "g", "t", "a"]

    iex>aa = Bio.Sequence.AminoAcid.new("ymabagta")
    ...>Enum.slice(aa, 2, 2)
    %Bio.Sequence.AminoAcid{sequence: "ab", length: 2, label: ""}

  If you are interested in defining conversions of amino acids then look into
  the `Bio.Sequence.Polymer` module for how to deal with creating a Conversion
  module. The simple `Bio.Sequence.AminoAcid` does define the
  `Bio.Protocols.Convertible` protocol.
  """
  use Bio.SimpleSequence

  defmodule DefaultConversions do
    def to(_), do: {:error, :undef_conversion}
  end
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
