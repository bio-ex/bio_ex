defmodule Bio.Sequence.DnaDoubleStrand do
  alias Bio.Sequence.{DnaStrand, RnaStrand, RnaDoubleStrand}

  defstruct top_strand: DnaStrand.new("", length: 0),
            bottom_strand: DnaStrand.new("", length: 0),
            complement_offset: 0

  defmodule DefaultConversions do
    @moduledoc false

    @doc false
    def to(RnaDoubleStrand), do: DnaStrand.DefaultConversions.to(RnaStrand)
    def to(_), do: {:error, :undef_conversion}
  end
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
end
