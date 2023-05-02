defmodule Bio.Sequence.RnaDoubleStrand do
  @behaviour Bio.Behaviors.Sequence
  alias Bio.Sequence.{Rna, RnaStrand, DnaStrand, DnaDoubleStrand}

  defstruct top_strand: RnaStrand.new("", length: 0),
            bottom_strand: RnaStrand.new("", length: 0),
            complement_offset: 0

  @impl Bio.Behaviors.Sequence
  def new(top_strand, opts \\ []) when is_binary(top_strand) do
    top = RnaStrand.new(top_strand)
    bottom = Keyword.get(opts, :bottom_strand, Rna.reverse_complement(top))

    %__MODULE__{
      top_strand: top,
      bottom_strand: bottom,
      complement_offset: Keyword.get(opts, :complement_offset, 0)
    }
  end

  @impl Bio.Behaviors.Sequence
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
