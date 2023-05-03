defmodule Bio.Sequence.RnaDoubleStrand do
  @behaviour Bio.Behaviours.Sequence
  alias Bio.Sequence.{Rna, RnaStrand, DnaStrand, DnaDoubleStrand}

  defstruct top_strand: RnaStrand.new("", length: 0),
            bottom_strand: RnaStrand.new("", length: 0),
            complement_offset: 0

  @impl Bio.Behaviours.Sequence
  def new(top_strand, opts \\ []) when is_binary(top_strand) do
    label = Keyword.get(opts, :label, "")
    top = RnaStrand.new(top_strand, label: label)

    bottom =
      Keyword.get(opts, :bottom_strand, Rna.complement(top_strand))
      |> RnaStrand.new(label: "#{label} <bottom>")

    %__MODULE__{
      top_strand: top,
      bottom_strand: bottom,
      complement_offset: Keyword.get(opts, :complement_offset, 0)
    }
  end

  @impl Bio.Behaviours.Sequence
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
