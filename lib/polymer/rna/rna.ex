defmodule Bio.Polymer.Rna do
  alias __MODULE__, as: Self
  alias Bio.Polymer.Overhangs

  @rna_complement %{
    "a" => "u",
    "c" => "g",
    "g" => "c",
    "u" => "a"
  }

  @rna_to_dna %{
    "a" => "a",
    "c" => "c",
    "g" => "g",
    "u" => "t"
  }

  defstruct top: "",
            bottom: "",
            bottom_length: 0,
            top_length: 0,
            offset: 0,
            overhangs: %Overhangs{},
            orientation: {5, 3},
            label: ""

  def from_binary(poly) when is_binary(poly) do
    %Self{}
  end

  def from_binary(poly, _opts) when is_binary(poly) do
    %Self{}
  end

  def complement(char) do
    Map.get(@rna_complement, char)
  end

  def dna_nucleotide(char) do
    Map.get(@rna_to_dna, char)
  end

  def to(poly, type, opts \\ [])

  def to(%Self{}, :dna, _opts) do
    @rna_to_dna
  end
end
