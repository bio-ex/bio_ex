defmodule BioPolymerOverhangsTest do
  use ExUnit.Case
  doctest Bio.Polymer.Overhangs

  alias Bio.Polymer.Overhangs, as: Subject

  describe "Subject.from/3" do
    test "blunt ends no overhangs" do
      top = {"aattggcc", 8}
      bottom = {"ttaaccgg", 8}

      assert Subject.from(top, bottom, 0) == %Subject{}
    end

    test "blunt right hand top_left overhang" do
      top = {"nnttggcc", 8}
      bottom = {"aaccgg", 6}

      assert Subject.from(top, bottom, 2) == %Subject{top_left: "nn"}
    end

    test "blunt right hand bottom_left overhang" do
      top = {"ttggcc", 6}
      bottom = {"nnaaccgg", 8}

      assert Subject.from(top, bottom, -2) == %Subject{bottom_left: "nn"}
    end

    test "blunt left hand top_right overhang" do
      top = {"ttaaccnn", 8}
      bottom = {"aattgg", 6}

      assert Subject.from(top, bottom, 0) == %Subject{top_right: "nn"}
    end

    test "blunt left hand bottom_right overhang" do
      top = {"aattgg", 6}
      bottom = {"ttaaccnn", 8}

      assert Subject.from(top, bottom, 0) == %Subject{bottom_right: "nn"}
    end

    test "smaller lower strand left/right top overhangs" do
      top = {"nnttggnn", 8}
      bottom = {"aacc", 4}

      assert Subject.from(top, bottom, 2) == %Subject{top_left: "nn", top_right: "nn"}
    end

    test "smaller upper strand left/right bottom overhangs" do
      top = {"aacc", 4}
      bottom = {"nnttggnn", 8}

      assert Subject.from(top, bottom, -2) == %Subject{bottom_left: "nn", bottom_right: "nn"}
    end

    test "uneven length upper left, lower right" do
      top = {"nncc", 4}
      bottom = {"ggnnnnnn", 8}

      assert Subject.from(top, bottom, 2) == %Subject{top_left: "nn", bottom_right: "nnnnnn"}
    end

    test "uneven length lower left, upper right" do
      top = {"ggnnnnnn", 8}
      bottom = {"nncc", 4}

      assert Subject.from(top, bottom, -2) == %Subject{bottom_left: "nn", top_right: "nnnnnn"}
    end
  end
end
