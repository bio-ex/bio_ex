defmodule BioPolymerDnaTest do
  use ExUnit.Case
  doctest Bio.Polymer.Dna

  alias Bio.Polymer.Dna, as: Subject

  describe "using a simple binary" do
    test "complement to dna" do
      dna = "ttacgtctcagtagc"
      expected = "aatgcagagtcatcg"

      assert Subject.complement(dna) == expected
    end

    test "complement to _ambiguous_ dna" do
      dna = "tmtacgyctcagrtagc"
      expected = "akatgcrgagtcyatcg"

      assert Subject.complement(dna, ambiguous: true) == expected
    end

    test "reverse complement to dna" do
      dna = "ttacgtctcagtagc"
      expected = "gctactgagacgtaa"

      assert Subject.reverse_complement(dna) == expected
    end
  end

  describe "reverse complement" do
    test "it creates a reverse complement to a binary" do
      assert Subject.reverse_complement("tatgct") == "agcata"
    end

    test "it creates a reverse complement to a Bio.Polymer" do
      base = Bio.Polymer.from_binary("tatgct")
      expected = Bio.Polymer.from_binary("agcata")

      assert Subject.reverse_complement(base) == expected
    end
  end
end
