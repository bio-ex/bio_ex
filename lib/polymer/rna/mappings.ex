defmodule Bio.Polymer.Rna.Mappings do
  @doc """
  Mapping RNA nucleotides to their complements

  ## Example

      iex> Map.get(Bio.Polymer.Dna.Mappings.rna_complement, "u")
      "a"

  """
  def complement do
    %{
      "a" => "u",
      "c" => "g",
      "g" => "c",
      "u" => "a"
    }
  end

end
