defmodule Bio.Sequence.RnaDoubleStrand do
  alias Bio.Sequence.{RnaStrand, DnaStrand, DnaDoubleStrand}
  alias Bio.Sequence.Rna.Conversions

  defstruct top_strand: RnaStrand.new("", length: 0),
            bottom_strand: RnaStrand.new("", length: 0),
            complement_offset: 0

  defmodule DefaultConversions do
    def to(DnaDoubleStrand), do: Conversions.to(DnaStrand)
  end
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
end
