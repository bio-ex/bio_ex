defmodule Sequence.RnaStrandTest do
  use ExUnit.Case, async: true

  alias Bio.Sequence.RnaStrand, as: Subject
  alias Bio.Sequence.RnaStrand

  doctest Subject
end

defmodule Sequence.RnaDoubleStrandTest do
  use ExUnit.Case, async: true

  alias Bio.Sequence.RnaDoubleStrand, as: Subject

  doctest Subject
end
