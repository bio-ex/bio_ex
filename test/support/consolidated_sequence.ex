defmodule ConsolidatedSequence do
  use Bio.SimpleSequence

  @impl Bio.Behaviours.Sequence
  def converter, do: nil
end
