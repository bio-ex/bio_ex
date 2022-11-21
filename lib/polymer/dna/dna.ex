defmodule Bio.Polymer.Dna do
  @moduledoc """
  This module expresses the logic of dealing with polymers of DNA.

  In general, the assumption is that the data being given to anything is either a
  binary or a struct of the DNA module itself. This is done for ease of use, and
  the `Bio.Polymer.Dna` struct is defined as having a top and bottom strand, with
  an offset for the representation.

  The representation of the polymer is such that you also need an orientation to
  know which end is the 5 prime and which is the 3 prime. The oreientation is
  expressed as a tuple of {top, bottom} where the left side of the strand is
  described. Therefore, {5, 3} implies that the left hand side of the top is the
  5 prime end, while the bottom is the 3 prime (the normal configuration).
  """
  defstruct polymer: %{top: "", bottom: "", offset: 0, orientation: {5, 3}}
  alias Bio.Polymer.Dna, as: Self

  @doc """
  Create a `Bio.Polymer.Dna` struct from a regular binary

  Given a binary such as "atgccatgagatcctag", produce a struct with an offset of
  the given value or zero.

  ## Example

      iex> Bio.Polymer.Dna.from_binary("atgccatgagatcctag")
      %Bio.Polymer.Dna{polymer: %{top: "atgccatgagatcctag", bottom: "tacggtactctaggatc", offset: 0, orientation: {5, 3}}}
  """
  def from_binary(dna, offset \\ 0) do
    %Self{
      polymer: %{
        top: dna,
        bottom: Self.complement(dna),
        offset: offset,
        orientation: {5, 3}
      }
    }
  end

  @doc """
  Generate the complement to a given segment of DNA. Does not perform
  any sort of validation of the DNA.

  ## Example

      iex> Bio.Polymer.Dna.complement("gatacgt")
      "ctatgca"
  """
  def complement(dna) when is_binary(dna) do
    dna
    |> String.graphemes()
    |> Enum.map(fn char ->
      Map.get(Self.Mappings.dna_complement(), char)
    end)
    |> List.to_string()
  end

  def complement(%Self{
        polymer: %{offset: offset, orientation: orientation, top: top, bottom: bottom}
      }) do
    %Self{
      polymer: %{
        top: bottom,
        bottom: top,
        orientation: orientation,
        offset: offset
      }
    }
  end

  @doc """
  Generate the reverse complement to a given segment of DNA. Does not perform
  any sort of validation of the DNA.

  ## Example

      iex> Bio.Polymer.Dna.reverse_complement("gatacgt")
      "acgtatc"
  """
  def reverse_complement(dna) do
    dna |> complement() |> String.reverse()
  end
end
