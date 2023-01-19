defmodule Bio.IO.QualityScore do
  alias __MODULE__, as: Self

  @q_score_offset 33

  defstruct scoring_characters: "",
            q_scores: '',
            label: ""

  def from_binary(bin, opts \\ []) do
    label = Keyword.get(opts, :label, "")

    %Self{
      scoring_characters: bin,
      q_scores:
        bin
        |> String.to_charlist()
        |> Enum.map(&(&1 - @q_score_offset)),
      label: label
    }
  end
end
