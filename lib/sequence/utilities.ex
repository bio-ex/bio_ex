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
end
