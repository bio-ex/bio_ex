defmodule Bio.Polymer do
  @moduledoc """
  This module houses the functions that act on biological polymers.

  Each polymer type is defined as it's own module with a related struct for the
  polymer definition, while there is a general `Bio.Polymer` struct for things
  that are not necessarily known (e.g. input from a FASTA file).

  The `Bio.Polymer` struct is the simplest, exposing merely the sequence and its
  length.
  """
  alias Bio.Polymer.Conversions

  defstruct sequence: "", length: 0

  @doc """
  Converts between polymers that can have that done.

  ## Examples

      iex> Bio.Polymer.convert_to("taggatc", :rna, :dna)
      "uaggauc"

      iex> Bio.Polymer.convert_to("uaggauc", :dna, :rna)
      "taggatc"
  """
  def convert_to(binary, :rna, :dna) do
    binary
    |> String.graphemes()
    |> Enum.map(&Conversions.dna_to_rna/1)
    |> List.to_string()
  end

  def convert_to(binary, :dna, :rna) do
    binary
    |> String.graphemes()
    |> Enum.map(&Conversions.rna_to_dna/1)
    |> List.to_string()
  end
end
