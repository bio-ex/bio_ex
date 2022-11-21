defmodule Bio.Polymer.Dna.Mappings do
  @moduledoc """
  Mappings for various sequences.

  Essentially, if there is a way to map from one encoding to another for a given
  sequence, it will live here. Including:
  - DNA
  - RNA
  - Amino Acids
  - etc...
  """

  @ambiguous_dna ~w(r y s w k m b d h v n)

  @doc """
  Exposes ambiguous DNA codes according to IUPAC
  """
  def ambiguous_dna() do
    @ambiguous_dna
  end

  @doc """
  Mapping nucleotides to their chemical names

  ## Example

      iex> Map.get(Bio.Polymer.Dna.Mappings.nucleotide_to_name, "a")
      "adenine"
  """
  def nucleotide_to_name do
    %{
      "a" => "adenine",
      "c" => "cytosine",
      "g" => "guanine",
      "t" => "thymine",
      "u" => "uracil"
    }
  end

  @doc """
  Mapping DNA nucleotides to their complements

  ## Example

      iex> Map.get(Bio.Polymer.Dna.Mappings.dna_complement, "a")
      "t"

  """
  def dna_complement do
    %{
      "a" => "t",
      "c" => "g",
      "g" => "c",
      "t" => "a"
    }
  end

  @doc """
  Mapping RNA nucleotides to their complements

  ## Example

      iex> Map.get(Bio.Polymer.Dna.Mappings.rna_complement, "u")
      "a"

  """
  def rna_complement do
    %{
      "a" => "u",
      "c" => "g",
      "g" => "c",
      "u" => "a"
    }
  end

  @doc """
  Mapping DNA nucleotides to their complements, where their complements are
  defined as a list of accepted nucleotides.

  ## Example

      iex> Map.get(Bio.Polymer.Dna.Mappings.dna_ambiguous, "b")
      ["c", "g", "t"]

  """
  def dna_ambiguous do
    %{
      "r" => ["a", "g"],
      "y" => ["c", "t"],
      "s" => ["g", "c"],
      "w" => ["a", "t"],
      "k" => ["g", "t"],
      "m" => ["a", "c"],
      "b" => ["c", "g", "t"],
      "d" => ["a", "g", "t"],
      "h" => ["a", "c", "t"],
      "v" => ["a", "c", "g"],
      "n" => ["a", "c", "g", "t"]
    }
  end
end
