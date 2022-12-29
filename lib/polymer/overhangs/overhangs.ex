defmodule Bio.Polymer.Overhangs do
  @moduledoc """
  This module is not necessarily meant to be used by an outside user.

  This module defines the essential logic for an overhang in a double-stranded
  polymer. These behaviors are, hopefully, generalizable to any polymer that
  displays a paired strand, such as DNA and RNA.

  The primary use case is with DNA and RNA molecules where they may or may not
  align correctly in their current annealing.
  """
  alias __MODULE__, as: Self
  defstruct top_left: "", top_right: "", bottom_left: "", bottom_right: ""

  @doc """
  Create an overhang struct from the data relating to a polymer double-strand.
  This requires that you have a concept of the offset of the strand, as well as
  the contents of both.

  For the purpose of this module, the offset is assumed to be in-line with what
  the `Bio.Polymer.Dna` and `Bio.Polymer.Rna` modules define it as. This is also
  why the strands are regarded as top and bottom, though they needn't strictly
  be interpreted as such.
  """
  def from({top, top_length}, {bottom, bottom_length}, offset) do
    get_overhangs({top, top_length}, {bottom, bottom_length}, offset)
  end

  defp get_overhangs({top, top_len}, {bottom, bottom_len}, offset) when offset > 0 do
    %Self{
      top_left: String.slice(top, 0, offset),
      top_right: String.slice(top, bottom_len + offset, top_len),
      bottom_right: String.slice(bottom, top_len - offset, bottom_len)
    }
  end

  defp get_overhangs({top, top_len}, {bottom, bottom_len}, offset) when offset < 0 do
    %Self{
      top_right: String.slice(top, bottom_len + offset, top_len),
      bottom_right: String.slice(bottom, top_len - offset, bottom_len),
      bottom_left: String.slice(bottom, 0, -offset)
    }
  end

  defp get_overhangs({top, top_len}, {bottom, bottom_len}, offset) when offset == 0 do
    %Self{
      top_right: String.slice(top, bottom_len, top_len),
      bottom_right: String.slice(bottom, top_len, bottom_len)
    }
  end
end
