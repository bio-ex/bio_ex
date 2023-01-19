defmodule Bio.IO.Utilities do
  alias Bio.Polymer.{Dna, Rna, AminoAcid}

  def sequence(:dna, seq, label) do
    Dna.from_binary(seq, label: label)
  end

  def sequence(:rna, seq, label) do
    Rna.from_binary(seq, label: label)
  end

  def sequence(:amino_acid, seq, label) do
    AminoAcid.from_binary(seq, label: label)
  end

  def sequence(:binary, seq, label) do
    {seq, label}
  end

  def sequence(nil, seq, label) do
    Bio.Polymer.from_binary(seq, label: label)
  end
end
