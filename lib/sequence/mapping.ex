defmodule Bio.Sequence.Mapping do
  @moduledoc """
  Mappings for various sequences.

  This module exists to provide convenience mappings from polymer elements to
  alternative representations that don't make sense as members of the
  `Bio.Sequence.Alphabets` module.
  """

  @doc """
  Mapping nucleotides to their chemical names

  ## Example

      iex> Map.get(Bio.Sequence.Mapping.nucleotide_to_name, "a")
      "adenine"
  """
  def nucleotide_to_name do
    %{
      "a" => "adenine",
      "c" => "cytosine",
      "g" => "guanine",
      "t" => "thymine",
      "u" => "uracil"
    }
  end
end
