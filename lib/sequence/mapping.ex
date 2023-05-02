defmodule Bio.Sequence.MonomerName do
  @moduledoc """
  Mappings for various sequences.

  This module exists to provide convenience mappings from polymer elements to
  alternative representations that don't make sense as members of the
  `Bio.Sequence.Alphabets` module.
  """

  # TODO: should these all be lists and we include all the ambiguous stuff?
  @dna_names %{
    "a" => "adenine",
    "c" => "cytosine",
    "g" => "guanine",
    "t" => "thymine"
  }

  @rna_names Map.merge(@dna_names, %{"u" => "uracil"})
  @amino_names %{
    "a" => "alanine",
    "r" => "arginine",
    "n" => "asparagine",
    "d" => "aspartic acid",
    "c" => "cysteine",
    "q" => "glutamine",
    "e" => "glutamic acid",
    "g" => "glycine",
    "h" => "histidine",
    "i" => "isoleucine",
    "l" => "leucine",
    "k" => "lysine",
    "m" => "methionine",
    "f" => "phenylalanine",
    "p" => "proline",
    "o" => "pyrrolysine",
    "s" => "serine",
    "u" => "selenocysteine",
    "t" => "threonine",
    "w" => "tryptophan",
    "y" => "tyrosine",
    "v" => "valine",
    "b" => "aspartic acid or asparagine",
    "z" => "glutamic acid or glutamine",
    "x" => "any amino acid",
    "j" => "leucine or isoleucine"
  }

  @doc """
  Mapping nucleotides to their chemical names

  ## Example

      iex>MonomerName.nucleic_acid("a")
      "adenine"
  """
  def nucleic_acid(value) do
    get(value, @rna_names)
  end

  @doc """
  Mapping amino acids to their chemical names

  ## Example

      iex>MonomerName.nucleic_acid("a")
      "adenine"
  """
  def amino_acid(value) do
    get(value, @amino_names)
  end

  defp get(value, map) do
    value
    |> String.downcase()
    |> then(&Map.get(map, &1))
  end
end
