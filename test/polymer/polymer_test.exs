defmodule Bio.PolymerTest do
  use ExUnit.Case, async: true

  alias Bio.Polymer, as: Subject

  doctest Subject

  describe "enumerability" do
    test "polymer can be mapped" do
      base = Subject.from_binary("contents")
      assert Enum.map(base, & &1) == ~w(c o n t e n t s)
    end

    test "polymer can be reduced" do
      base = Subject.from_binary("contents")

      assert Enum.reduce(base, %{}, fn e, m ->
               Map.put(m, e, e)
             end) == %{"c" => "c", "e" => "e", "n" => "n", "o" => "o", "s" => "s", "t" => "t"}
    end

    test "polymer can membership checked" do
      base = Subject.from_binary("hello mr anderson")

      assert "mr" in base
      refute "johnson" in base
      assert "hello" in base
    end

    test "polymer can be sliced" do
      base = Subject.from_binary("I am a teapot")

      assert Enum.slice(base, 5, 5) == %Subject{sequence: "a tea", length: 5}
    end
  end
end
