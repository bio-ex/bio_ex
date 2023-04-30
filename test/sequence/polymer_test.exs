defmodule Sequence.PolymerTest do
  use ExUnit.Case, async: true

  alias Bio.Sequence.Polymer, as: Subject
  alias Bio.Sequence.{Polymer, RnaStrand, RnaDoubleStrand, DnaStrand, DnaDoubleStrand, AminoAcid}

  doctest Subject

  describe "convert/3" do
    test "converts dna to rna using default mapping" do
      label = "test strand"
      test = DnaStrand.new("ttaaggcc", label: label)
      expected = RnaStrand.new("uuaaggcc", label: label)

      assert expected == Subject.convert(test, RnaStrand)
    end

    test "converts rna to dna using default mapping" do
      label = "test strand"
      test = RnaStrand.new("uuaaggcc", label: label)
      expected = DnaStrand.new("ttaaggcc", label: label)

      assert expected == Subject.convert(test, DnaStrand)
    end

    test "converts rna double to dna double using default mapping" do
      label = "test strand"
      test = RnaStrand.new("uuaaggcc", label: label)
      expected = DnaStrand.new("ttaaggcc", label: label)

      assert expected == Subject.convert(test, DnaStrand)
    end

    test "converts dna double to rna double using default mapping" do
      label = "test strand"
      test = %DnaDoubleStrand{to_strand: DnaStrand.new("ttaaggcc", label: label)}
      expected = RnaStrand.new("uuaaggcc", label: label)

      assert expected == Subject.convert(test, RnaStrand)
    end
  end
end
