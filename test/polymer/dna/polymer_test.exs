defmodule BioPolymerDnaTest do
  use ExUnit.Case
  doctest Bio.Polymer.Dna

  alias Bio.Polymer.Dna, as: Subject

  test "complement to dna" do
    dna = "ttacgtctcagtagc"
    expected = "aatgcagagtcatcg"

    assert Subject.complement(dna) == expected
  end

  test "reverse complement to dna" do
    dna = "ttacgtctcagtagc"
    expected = "gctactgagacgtaa"

    assert Subject.reverse_complement(dna) == expected
  end
end
