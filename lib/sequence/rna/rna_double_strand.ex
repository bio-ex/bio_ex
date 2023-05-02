defmodule Bio.Sequence.RnaDoubleStrand do
  @behaviour Bio.Behaviors.Sequence
  alias Bio.Sequence.{RnaStrand, DnaStrand, DnaDoubleStrand}

  defstruct top_strand: RnaStrand.new("", length: 0),
            bottom_strand: RnaStrand.new("", length: 0),
            complement_offset: 0

  def new(_base, _options) do
  end

  def converter, do: Bio.Sequence.Rna.Conversions
end

defimpl Bio.Protocols.Convertible, for: Bio.Sequence.RnaDoubleStrand do
  alias Bio.Sequence.{DnaStrand, RnaDoubleStrand, DnaDoubleStrand}

  def convert(
        %RnaDoubleStrand{
          top_strand: top,
          bottom_strand: bottom,
          complement_offset: offset
        },
        DnaDoubleStrand,
        converter
      ) do
    new_top =
      top
      |> Enum.map(converter)
      |> Enum.join("")
      |> DnaStrand.new(label: top.label)

    new_bottom =
      bottom
      |> Enum.map(converter)
      |> Enum.join("")
      |> DnaStrand.new(label: bottom.label)

    %DnaDoubleStrand{
      top_strand: new_top,
      bottom_strand: new_bottom,
      complement_offset: offset
    }
  end

  def convert(_, _, _), do: {:error, :undef_conversion}
end
