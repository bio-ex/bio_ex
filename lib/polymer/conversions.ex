defmodule Bio.Polymer.Conversions do
  @moduledoc """
  Map the conversions between polymer elements
  """

  def dna_to_rna(char) do
    case char do
      "t" -> "u"
      _ -> char
    end
  end

  def rna_to_dna(char) do
    case char do
      "u" -> "t"
      _ -> char
    end
  end
end
