defmodule Bio.Sequence.Utilities do
  @capitalized? ~r/^\p{Lu}$/u

  def upper?(value) do
    value =~ @capitalized?
  end
end
