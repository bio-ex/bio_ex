defmodule Bio.Sequence.DnaDoubleStrand do
  @behaviour Bio.Behaviors.Sequence
  alias Bio.Sequence.{Dna, DnaStrand, RnaStrand, RnaDoubleStrand}

  defstruct top_strand: DnaStrand.new("", length: 0),
            bottom_strand: DnaStrand.new("", length: 0),
            complement_offset: 0

  @impl Bio.Behaviors.Sequence
  def new(top_strand, opts \\ []) when is_binary(top_strand) do
    top = DnaStrand.new(top_strand)
    bottom = Keyword.get(opts, :bottom_strand, Dna.reverse_complement(top))

    %__MODULE__{
      top_strand: top,
      bottom_strand: bottom,
      complement_offset: Keyword.get(opts, :complement_offset, 0)
    }
  end

  @impl Bio.Behaviors.Sequence
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
