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

    test "reverse complement to dna" do
      dna = "ttacgtctcagtagc"
      expected = "gctactgagacgtaa"

      assert Subject.reverse_complement(dna) == expected
    end
  end

  describe "using a module struct" do
    test "complement to dna" do
      dna = Subject.from_binary("ttacgtctcagtagc")
      IO.puts(Subject.from_binary("ttacgtctcagtagc", 4))

      expected = %Subject{
        top: "aatgcagagtcatcg",
        bottom: "ttacgtctcagtagc",
        orientation: {3, 5},
        top_length: 15,
        bottom_length: 15
      }

      assert Subject.complement(dna) == expected
    end
  end
end
