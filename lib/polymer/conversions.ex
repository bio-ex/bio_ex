defmodule Bio.Polymer.Conversions do
  @moduledoc """
  Map the conversions between polymer elements
  """

  def dna_to_rna do
    %{
      "a" => "u",
      "t" => "a",
      "g" => "c",
      "c" => "g"
    }
  end

  def rna_to_dna do
    %{
      "a" => "t",
      "u" => "a",
      "g" => "c",
      "c" => "g"
    }
  end
end
