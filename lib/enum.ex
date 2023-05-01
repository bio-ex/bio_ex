defmodule Bio.Enum do
  @moduledoc """
  Implements a wrapper around the Enum module's public interface.

  The semantics of the Enum module don't always match up with what I would think
  is best for certain cases. The best example of this is the `slide/3` function.
  Because of the Enum implementation, there is no way to coerce the return
  value back into a struct. So for example, given a `Bio.Sequence.DnaStrand` it
  would return a list of graphemes. This is not what I want users to expect.

  That said, there are other functions that _do_ behave well. Or at the very
  least, their semantics seem meaningfully useful. So in order to preserve the
  maximum utility, I will wrap the module.

  The expectation should be as follows:
  `Enum` functions will return bare data.
  `Bio.Enum` functions will return the closest thing to the struct as is
  reasonable.

  There are cases where it doesn't make much sense to return more than is
  required. For example, the `Bio.Enum.at/2` function will return a binary
  grapheme. I have a hard time imagining a case where the user would want a
  struct with a sequence of a single character instead of the character itself.

  Contrast that with the `Enum.at/2` function, which will return a raw char.
  """

  def all?(enumerable), do: Enum.all?(enumerable)
  def all?(enumerable, func), do: Enum.all?(enumerable, func)

  def any?(enumerable), do: Enum.any?(enumerable)
  def any?(enumerable, func), do: Enum.any?(enumerable, func)

  def at(enumerable, index) when is_integer(index) do
    Enum.at(enumerable, index)
    |> then(&[&1])
    |> List.to_string()
  end

  def at(enumerable, index, default) when is_integer(index) do
    Enum.at(enumerable, index, default)
    |> then(&[&1])
    |> List.to_string()
  end

  def chunk_by(enumerable, func) do
    Enum.chunk_by(enumerable, func)
    |> Enum.map(&Enum.join/1)
    |> Enum.map(&apply(enumerable.__struct__, :new, [&1, [label: enumerable.label]]))
  end

  def chunk_every(enumerable, count),
    do:
      Stream.chunk_every(enumerable, count)
      |> Stream.map(&Enum.join/1)
      |> Enum.map(&apply(enumerable.__struct__, :new, [&1, [label: enumerable.label]]))

  def chunk_every(enumerable, count, step),
    do:
      Stream.chunk_every(enumerable, count, step)
      |> Stream.map(&Enum.join/1)
      |> Enum.map(&apply(enumerable.__struct__, :new, [&1, [label: enumerable.label]]))

  def chunk_every(enumerable, count, step, options),
    do:
      Stream.chunk_every(enumerable, count, step, options)
      |> Stream.map(&Enum.join/1)
      |> Enum.map(&apply(enumerable.__struct__, :new, [&1, [label: enumerable.label]]))

  def chunk_while(enumerable, acc, chunk_fun, after_fun),
    do:
      Enum.chunk_while(enumerable, acc, chunk_fun, after_fun)
      |> Enum.map(&Enum.join/1)
      |> Enum.map(&apply(enumerable.__struct__, :new, [&1, label: enumerable.label]))

  # TODO: figure out the semantics for concatenation with non-sequence
  # enumerables
  def concat(a), do: {a}
  def concat(a, b), do: {a, b}

  def count(enumerable), do: Enum.count(enumerable)
  def count(enumerable, fun), do: Enum.count(enumerable, fun)

  def count_until(a), do: {a}
  def count_until(a, b), do: {a, b}

  def dedup(), do: {}

  def dedup_by(), do: {}

  def drop(), do: {}

  def drop_every(), do: {}

  def drop_while(), do: {}

  def each(), do: {}

  def empty?(), do: {}

  def fetch!(), do: {}

  def fetch(), do: {}

  def filter(), do: {}

  def find(a), do: {a}
  def find(a, b), do: {a, b}

  def find_index(), do: {}

  def find_value(a), do: {a}
  def find_value(a, b), do: {a, b}

  def flat_map(), do: {}

  def flat_map_reduce(), do: {}

  def frequencies(), do: {}

  def frequencies_by(), do: {}

  def group_by(a), do: {a}
  def group_by(a, b), do: {a, b}

  def intersperse(), do: {}

  def into(a), do: {a}
  def into(a, b), do: {a, b}

  def join(a), do: {a}
  def join(a, b), do: {a, b}

  def map(), do: {}

  def map_every(), do: {}

  def map_intersperse(), do: {}

  def map_join(a), do: {a}
  def map_join(a, b), do: {a, b}

  def map_reduce(), do: {}

  def max(), do: {}

  def max_by(a), do: {a}
  def max_by(a, b), do: {a, b}

  def member?(), do: {}

  def min(), do: {}

  def min_by(a), do: {a}
  def min_by(a, b), do: {a, b}

  def min_max(a), do: {a}
  def min_max(a, b), do: {a, b}

  def min_max_by(a), do: {a}
  def min_max_by(a, b), do: {a, b}

  def product(), do: {}

  def random(), do: {}

  def reduce(a), do: {a}
  def reduce(a, b), do: {a, b}

  def reduce_while(), do: {}

  def reject(), do: {}

  def reverse(a), do: {a}
  def reverse(a, b), do: {a, b}

  def reverse_slice(), do: {}

  def scan(a), do: {a}
  def scan(a, b), do: {a, b}

  def shuffle(), do: {}

  def slice(a), do: {a}
  def slice(a, b), do: {a, b}

  def slide(), do: {}

  def sort(a), do: {a}
  def sort(a, b), do: {a, b}

  def sort_by(a), do: {a}
  def sort_by(a, b), do: {a, b}

  def split(), do: {}

  def split_while(), do: {}

  def split_with(), do: {}

  def sum(), do: {}

  def take(), do: {}

  def take_every(), do: {}

  def take_random(), do: {}

  def take_while(), do: {}

  def to_list(), do: {}

  def uniq(), do: {}

  def uniq_by(), do: {}

  def unzip(), do: {}

  def with_index(a), do: {a}
  def with_index(a, b), do: {a, b}

  def zip(a), do: {a}
  def zip(a, b), do: {a, b}

  def zip_reduce(a), do: {a}
  def zip_reduce(a, b), do: {a, b}

  def zip_with(a), do: {a}
  def zip_with(a, b), do: {a, b}
end
