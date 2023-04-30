defmodule Bio.Sequence.Utilities do
  @moduledoc false
  @capitalized? ~r/^\p{Lu}$/u

  @doc """
  Use the regular expression `^\p{Lu}$` to determine if a given binary value is
  uppercase or not.
  """
  def upper?(value) when is_binary(value) do
    value =~ @capitalized?
  end

  def slide(enumerable, start_index, insertion) when is_integer(start_index) do
    Enum.slide(enumerable, start_index, insertion)
    |> Enum.join()
    |> then(
      &apply(enumerable.__struct__, :new, [
        &1,
        [label: enumerable.label, length: enumerable.length]
      ])
    )
  end

  def slide(enumerable, start_index..end_index, insertion) do
    Enum.slide(enumerable, start_index..end_index, insertion)
    |> Enum.join()
    |> then(
      &apply(enumerable.__struct__, :new, [
        &1,
        [label: enumerable.label, length: enumerable.length]
      ])
    )
  end
end
