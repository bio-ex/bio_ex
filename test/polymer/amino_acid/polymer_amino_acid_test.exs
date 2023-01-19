defmodule Polymer.AminoAcid.PolymerAminoAcidTest do
  use ExUnit.Case, async: true

  alias Bio.Polymer.AminoAcid, as: Subject

  doctest Subject

  describe "enumerability" do
    test "amino acid can be mapped" do
      base = Subject.from_binary("magic")
      assert Enum.map(base, & &1) == ~w(m a g i c)
    end

    test "amino acid can be reduced" do
      base = Subject.from_binary("magic")

      assert Enum.reduce(base, %{}, fn e, m ->
               Map.put(m, e, e)
             end) == %{"c" => "c", "a" => "a", "g" => "g", "i" => "i", "m" => "m"}
    end

    test "amino acid can membership checked" do
      base = Subject.from_binary("magicthegathering")

      assert "agic" in base
      refute "da" in base
      assert "thegath" in base
    end

    test "polymer can be sliced" do
      base = Subject.from_binary("magicthegathering")

      assert Enum.slice(base, 5, 3) == %Subject{sequence: "the", length: 3}
    end
  end
end
