defmodule Sequence.DnaTest do
  use ExUnit.Case, async: true

  alias Bio.Sequence.Dna, as: Subject
  alias Bio.Sequence.{Polymer, Dna, DnaStrand, RnaStrand}

  doctest Subject
end

defmodule Sequence.DnaStrandTest do
  use ExUnit.Case, async: true

  alias Bio.Sequence.DnaStrand, as: Subject
  alias Bio.Sequence.DnaStrand

  doctest Subject
end

defmodule Sequence.DnaDoubleStrandTest do
  use ExUnit.Case, async: true

  alias Bio.Sequence.DnaDoubleStrand, as: Subject

  doctest Subject
end
