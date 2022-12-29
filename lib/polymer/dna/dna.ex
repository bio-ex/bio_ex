defmodule Bio.Polymer.Dna do
  @moduledoc """
  This module expresses the logic of dealing with polymers of DNA.

  In general, the assumption is that the data being given to any function is either a
  binary or a struct of the DNA module itself. This is done for ease of use, and
  the `Bio.Polymer.Dna` struct is defined as having a top and bottom strand, with
  an offset for the representation of a non-blunt strand.

  The representation of the polymer is such that you also need an orientation to
  know which end is the 5 prime and which is the 3 prime. The orientation is
  expressed as a tuple of {top, bottom} where the left side of the strand is
  described. Therefore, {5, 3} implies that the left hand side of the top is the
  5 prime end, while the bottom is the 3 prime (the normal configuration).

  Overhangs are represented as a `Bio.Polymer.Overhangs` struct.

  The struct will also carry the top/bottom strand lengths.
  """
  alias __MODULE__, as: Self
  alias Bio.Polymer.Overhangs

  defstruct top: "",
            bottom: "",
            bottom_length: 0,
            top_length: 0,
            offset: 0,
            overhangs: %Overhangs{},
            orientation: {5, 3}

  @doc """
  Create a `Bio.Polymer.Dna` struct from a regular binary, O(N) where N is the
  size of the binary.

  Given a binary such as "atgccatgagatcctag", produce a struct with an offset of
  the given value or zero.

  Producing a struct in this way will always produce two even stranded DNA
  objects. It is not possible to use a single strand to define an uneven double
  strand. That can be done using `Bio.Polymer.Dna.from_binaries/2`

  ## Example

      iex> Bio.Polymer.Dna.from_binary("atgccatgagatcctag")
      %Bio.Polymer.Dna{
        top: "atgccatgagatcctag",
        bottom: "tacggtactctaggatc",
        bottom_length: 17,
        top_length: 17,
        overhangs: %Bio.Polymer.Overhangs{top_left: "", top_right: "", bottom_left: "", bottom_right: ""},
        offset: 0,
        orientation: {5, 3}
      }

      iex> Bio.Polymer.Dna.from_binary("atgccatgagatcctag", 3)
      %Bio.Polymer.Dna{
        top: "atgccatgagatcctag",
        bottom: "tacggtactctaggatc",
        overhangs: %Bio.Polymer.Overhangs{top_left: "atg", top_right: "", bottom_left: "", bottom_right: "atc"},
        bottom_length: 17,
        top_length: 17,
        offset: 3,
        orientation: {5, 3}
      }
  """
  def from_binary(dna, offset \\ 0, orientation \\ {5, 3}) do
    {bottom, len} = internal_complement(dna)

    %Self{
      top: dna,
      bottom: bottom,
      top_length: len,
      bottom_length: len,
      offset: offset,
      overhangs: Overhangs.from({dna, len}, {bottom, len}, offset),
      orientation: orientation
    }
  end

  @doc """
  Generate the complement to a given segment of DNA. Does not perform
  any sort of validation of the DNA. O(N) where N is the size of the binary.

  Determining the "complement" of a double stranded piece of DNA is a little
  strange, but needs to be well defined in order for the reverse complement to
  make sense. In the base case (blunt, zero-offset) then you just swap the top
  and bottom. Things get trickier

  atgcatgc
  --catacgacga

  In this case, you have an offset of 2, with a top strand length of 8 and a
  bottom strand length of 10. Because we want to preserve the idea of just
  swapping the top and bottom strand, we also just negate the value of the
  offset.

  Also, this necessarily means that we need to swap the overhangs and
  orientation tuples.

  ## Example

      iex> Bio.Polymer.Dna.complement("gatacgt")
      "ctatgca"
  """
  def complement(dna) when is_binary(dna) do
    dna
    |> String.graphemes()
    |> Enum.map(fn char ->
      Map.get(Self.Mappings.complement(), char)
    end)
    |> List.to_string()
  end

  def complement(%Self{
        offset: offset,
        top_length: top_len,
        bottom_length: bottom_len,
        top: top,
        bottom: bottom,
        overhangs: overhangs,
        orientation: orientation
      }) do
    %Self{
      top: bottom,
      bottom: top,
      top_length: bottom_len,
      bottom_length: top_len,
      overhangs: swap(overhangs),
      orientation: swap(orientation),
      offset: -offset
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

  # used to get a complementary strand as well as the length without duplicating
  # the traversal of the string.
  defp internal_complement(bin_dna) do
    bin_dna
    |> String.graphemes()
    |> Enum.reduce({[], 0}, fn char, {str, size} ->
      {List.insert_at(str, size, Map.get(Self.Mappings.complement(), char)), size + 1}
    end)
    |> then(fn {l, s} -> {List.to_string(l), s} end)
  end

  defp swap({el1, el2} = value_set) when is_tuple(value_set) do
    {el2, el1}
  end

  defp swap(%Overhangs{top_right: tr, top_left: tl, bottom_right: br, bottom_left: bl}) do
    %Overhangs{top_left: bl, top_right: br, bottom_right: tr, bottom_left: tl}
  end
end

defimpl String.Chars, for: Bio.Polymer.Dna do
  def to_string(value) do
    "#{value.top}\n#{left_pad(value.bottom, value.offset)}"
  end

  defp left_pad(str, offset) when offset == 0 do
    str
  end

  defp left_pad(str, offset) when offset > 0 do
    left_pad(" #{str}", offset - 1)
  end
end
