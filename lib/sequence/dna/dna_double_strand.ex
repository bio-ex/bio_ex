defmodule Bio.Sequence.DnaDoubleStrand do
  @behaviour Bio.Behaviours.Sequence
  alias Bio.Sequence.{Dna, DnaStrand, RnaStrand, RnaDoubleStrand}

  @moduledoc """
  A representative struct for Double Stranded DNA polymers.

  This structure complexes two `Bio.Sequence.DnaStrand` structs along with the
  information regarding how to offset them. The `complement_offset` allows you
  to realize the correct representation of the string, and is used in the
  implementation for the `String.Chars` protocol.
  """

  defstruct top_strand: DnaStrand.new("", length: 0),
            bottom_strand: DnaStrand.new("", length: 0),
            complement_offset: 0

  @impl Bio.Behaviours.Sequence
  def new(top_strand, opts \\ []) when is_binary(top_strand) do
    label = Keyword.get(opts, :label, "")
    top = DnaStrand.new(top_strand, label: label)

    bottom =
      Keyword.get(opts, :bottom_strand, Dna.complement(top_strand))
      |> DnaStrand.new(label: "#{label} <bottom>")

    %__MODULE__{
      top_strand: top,
      bottom_strand: bottom,
      complement_offset: Keyword.get(opts, :complement_offset, 0)
    }
  end

  @impl Bio.Behaviours.Sequence
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
