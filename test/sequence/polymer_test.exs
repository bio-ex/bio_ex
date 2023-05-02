defmodule Sequence.PolymerDnaRnaTest do
  use ExUnit.Case, async: true

  alias Bio.Sequence.Polymer, as: Subject
  alias Bio.Sequence.{Polymer, RnaStrand, RnaDoubleStrand, DnaStrand, DnaDoubleStrand, AminoAcid}

  doctest Subject

  describe "convert/3" do
    test "converts dna to rna using default mapping" do
      label = "test strand"
      test = DnaStrand.new("ttaaggcc", label: label)
      expected = RnaStrand.new("uuaaggcc", label: label)

      assert {:ok, expected} == Subject.convert(test, RnaStrand)
    end

    test "dna to rna doesn't break casing" do
      label = "test strand"
      test = DnaStrand.new("TtAaGgCc", label: label)
      expected = RnaStrand.new("UuAaGgCc", label: label)

      assert {:ok, expected} == Subject.convert(test, RnaStrand)
    end

    test "converts rna to dna using default mapping" do
      label = "test strand"
      test = RnaStrand.new("uuaaggcc", label: label)
      expected = DnaStrand.new("ttaaggcc", label: label)

      assert {:ok, expected} == Subject.convert(test, DnaStrand)
    end

    test "rna to dna doesn't break casing" do
      label = "test strand"
      test = RnaStrand.new("UuAaGgCc", label: label)
      expected = DnaStrand.new("TtAaGgCc", label: label)

      assert {:ok, expected} == Subject.convert(test, DnaStrand)
    end

    test "converts rna double to dna double using default mapping" do
      label = "test strand"

      test = %RnaDoubleStrand{
        top_strand: RnaStrand.new("uuaaggcc", label: label),
        bottom_strand: RnaStrand.new("aauuccgg", label: label)
      }

      expected = %DnaDoubleStrand{
        top_strand: DnaStrand.new("ttaaggcc", label: label),
        bottom_strand: DnaStrand.new("aattccgg", label: label)
      }

      assert {:ok, expected} == Subject.convert(test, DnaDoubleStrand)
    end

    test "rna double to dna double preserves casing" do
      label = "test strand"

      test = %RnaDoubleStrand{
        top_strand: RnaStrand.new("UuAaGgCc", label: label),
        bottom_strand: RnaStrand.new("aAuUcCgG", label: label)
      }

      expected = %DnaDoubleStrand{
        top_strand: DnaStrand.new("TtAaGgCc", label: label),
        bottom_strand: DnaStrand.new("aAtTcCgG", label: label)
      }

      assert {:ok, expected} == Subject.convert(test, DnaDoubleStrand)
    end

    test "converts dna double to rna double using default mapping" do
      label = "test strand"

      test = %DnaDoubleStrand{
        top_strand: DnaStrand.new("ttaaggcc", label: label),
        bottom_strand: DnaStrand.new("aattccgg", label: label)
      }

      expected = %RnaDoubleStrand{
        top_strand: RnaStrand.new("uuaaggcc", label: label),
        bottom_strand: RnaStrand.new("aauuccgg", label: label)
      }

      assert {:ok, expected} == Subject.convert(test, RnaDoubleStrand)
    end

    test "dna double to rna double preserves casing" do
      label = "test strand"

      test = %DnaDoubleStrand{
        top_strand: DnaStrand.new("TtAaGgCc", label: label),
        bottom_strand: DnaStrand.new("aAtTcCgG", label: label)
      }

      expected = %RnaDoubleStrand{
        top_strand: RnaStrand.new("UuAaGgCc", label: label),
        bottom_strand: RnaStrand.new("aAuUcCgG", label: label)
      }

      assert {:ok, expected} == Subject.convert(test, RnaDoubleStrand)
    end
  end
end
