defmodule Bio.Sequence.DnaDoubleStrand do
  @behaviour Bio.Behaviors.Sequence
  alias Bio.Sequence.{DnaStrand, RnaStrand, RnaDoubleStrand}

  defstruct top_strand: DnaStrand.new("", length: 0),
            bottom_strand: DnaStrand.new("", length: 0),
            complement_offset: 0

  def new(_strand, _opts) do
  end

  def converter(), do: Bio.Sequence.Dna.Conversions
end

defimpl Bio.Protocols.Convertible, for: Bio.Sequence.DnaDoubleStrand do
  alias Bio.Sequence.{DnaDoubleStrand, RnaStrand, RnaDoubleStrand}

  def convert(
        %DnaDoubleStrand{
          top_strand: top,
          bottom_strand: bottom,
          complement_offset: offset
        },
        RnaDoubleStrand,
        converter
      ) do
    new_top =
      top
      |> Enum.map(converter)
      |> Enum.join("")
      |> RnaStrand.new(label: top.label)

    new_bottom =
      bottom
      |> Enum.map(converter)
      |> Enum.join("")
      |> RnaStrand.new(label: bottom.label)

    %RnaDoubleStrand{
      top_strand: new_top,
      bottom_strand: new_bottom,
      complement_offset: offset
    }
  end

  def convert(_, _, _), do: {:error, :undef_conversion}
end
