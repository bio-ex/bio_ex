defmodule Bio.Sequence.Dna do
  @moduledoc """
  A module for working with DNA.

  This module doesn't contain a representative struct, as with `Bio.Sequence.Rna`.
  This is because there are multiple ways to interpret a string as DNA. Namely, it
  can either be single or double stranded. This is why the
  `Bio.Sequence.DnaStrand` and `Bio.Sequence.DnaDoubleStrand` modules exist.

  However, this is the interface for dealing with things like `complement/1` and
  `reverse_complement/1`.

  Additionally, this module handles defining default conversions for the DNA
  sequence types into RNA sequence types (`Bio.Sequence.RnaStrand` and
  `Bio.Sequence.RnaDoubleStrand`). Conversions defined here are used by the
  `Bio.Sequence.DnaStrand` and `Bio.Sequence.DnaDoubleStrand` modules.

  The default conversions use conventional nucleotides and map them to their
  relevant RNA nucleotides:

  ```
  a -> a
  t -> u
  g -> g
  c -> c
  ```

  Casing is preserved, so mixed case sequences will not be altered.

  # Example

      iex>DnaStrand.new("taTTg")
      ...>|> Polymer.convert(RnaStrand)
      {:ok, %RnaStrand{sequence: "uaUUg", length: 5}}

  This is guaranteed, so you may encode these with intention and assume that
  they are preserved across conversions.
  """
  alias Bio.Sequence.{DnaStrand, RnaStrand, RnaDoubleStrand}
  alias Bio.Behaviours.Converter
  alias Bio.Enum, as: Bnum

  import Bio.Sequence.Utilities, only: [upper?: 1]

  @type complementable :: struct() | String.t()

  @complement %{
    "a" => "t",
    "A" => "T",
    "t" => "a",
    "T" => "A",
    "g" => "c",
    "G" => "C",
    "c" => "g",
    "C" => "G"
  }

  defmodule Conversions do
    @moduledoc false
    use Converter do
      def to(RnaStrand), do: {:ok, &to_rna/1}
      def to(RnaDoubleStrand), do: {:ok, &to_rna/1}
    end

    defp to_rna(base) do
      case upper?(base) do
        true ->
          case base do
            "A" -> "A"
            "T" -> "U"
            "G" -> "G"
            "C" -> "C"
          end

        false ->
          case base do
            "a" -> "a"
            "t" -> "u"
            "g" -> "g"
            "c" -> "c"
          end
      end
    end
  end

  @doc """
  Provide the DNA complement to a sequence.

  Given a sequence that is either a binary or a `Bio.Sequence.DnaStrand`,
  returns the DNA complement as defined by the standard nucleotide complements.

  # Examples
      iex>Dna.complement("attgacgt")
      "taactgca"

      iex>DnaStrand.new("attgacgt")
      ...>|> Dna.complement()
      %DnaStrand{sequence: "taactgca", length: 8}
  """
  @spec complement(sequence :: complementable) :: complementable
  def complement(%DnaStrand{} = sequence) do
    sequence
    |> Bnum.map(&Map.get(@complement, &1))
  end

  def complement(sequence) when is_binary(sequence) do
    sequence
    |> String.graphemes()
    |> Enum.map(&Map.get(@complement, &1))
    |> Enum.join()
  end

  @doc """
  Provide the DNA reverse complement to a sequence.

  Given a sequence that is either a binary or a `Bio.Sequence.DnaStrand`,
  returns the DNA reverse complement as defined by the standard nucleotide
  complements.

  # Examples
      iex>Dna.reverse_complement("attgacgt")
      "acgtcaat"

      iex>DnaStrand.new("attgacgt")
      ...>|> Dna.reverse_complement()
      %DnaStrand{sequence: "acgtcaat", length: 8}
  """
  @spec reverse_complement(sequence :: complementable) :: complementable
  def reverse_complement(sequence)

  def reverse_complement(%DnaStrand{} = sequence) do
    sequence
    |> Bnum.map(&Map.get(@complement, &1))
    |> Bnum.reverse()
  end

  def reverse_complement(sequence) when is_binary(sequence) do
    sequence
    |> String.graphemes()
    |> Enum.map(&Map.get(@complement, &1))
    |> Enum.reverse()
    |> Enum.join()
  end
end
