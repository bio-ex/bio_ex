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
