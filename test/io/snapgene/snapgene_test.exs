defmodule IO.SnapGene.SnapGeneTest do
  use ExUnit.Case, async: true

  alias Bio.IO.SnapGene, as: Subject

  doctest Subject

  test "reading sample e" do
    result = Subject.read("test/io/snapgene/sample-e.dna")

    assert result
  end

  test "reading sample f" do
    result = Subject.read("test/io/snapgene/sample-f.dna")

    assert result
  end

  test "reading sample d" do
    result = Subject.read("test/io/snapgene/sample-d.dna")

    assert result
  end

  test "reading pFA" do
    result = Subject.read("test/io/snapgene/pFA-KanMX4.dna")

    assert result
  end
end
