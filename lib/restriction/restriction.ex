defmodule Bio.Restriction do
  @moduledoc """
  Interaction between `Bio.Sequence` objects and `Bio.Restriction.Enzyme`s.

  The primary function is `digest/2`. The `digest/2` function works by recursively
  breaking down a binary and checking to see if the pattern for a given enzyme
  exists within it.

  > #### Redesign Incoming {: .warning}
  > Initially I had thought to just get the data and apply it. Having only been
  > familiar with quite a small sub-set of the possible digestion outcomes. That
  > said, I did some reading and it seems that having `digest/2` be type specific
  > to the type and sub-type of the enzyme is the best approach. That means that I
  > need to re-write the parser for the REBASE data. Which means that there's more
  > work to be done! When is that ever not true...
  > Anyway you probably don't want to use this until then.

  > #### Missing Functionality {: .warning}
  > Currently we don't support enzymes that have two cut sites, or
  > enzymes with ambiguous DNA recognition.


  > #### Missing Data {: .warning}
  > The enzyme HpyUM037X is removed from the set, since it has two conflicting
  > entries in the emboss data. If you can resolve this distinction, please feel
  > free to either contribute a fix, or open an issue that explains how one would
  > be implemented.
  """

  @doc """
  Digest takes in a string, anticipated to be a DNA sequence, and extracts the
  components of the string as a tuple that would remain after digestion with a
  given restriction enzyme.

  ## Examples
      iex> Bio.Restriction.digest("ttagatgacgtctcgattagagt", Bio.Restriction.Enzyme.bsmbi)
      ["ttagatgacgtctcg", "attagagt"]

  Currently this will work for enzymes that look back as well:

      iex> Bio.Restriction.digest("ggatgcagatcagacgaggattga", Bio.Restriction.Enzyme.bsp143i)
      ["ggatgc", "agatcagacgaggattga"]

  It does not yet work on enzymes that would produce digestions with three parts
  such as NmeDI, nor will it work on enzymes whose recognition pattern is
  defined using ambiguous DNA (even simply N).
  """
  @spec digest(dna :: String.t(), enzyme :: struct()) ::
          [String.t(), ...]
  def digest(dna, enzyme) do
    _digest("", dna, enzyme)
    |> List.flatten()
  end

  defp _digest(
         left,
         right,
         %Bio.Restriction.Enzyme{
           pattern: pattern,
           cut_1: cut_site_offset,
           cut_2: _fst3,
           cut_3: second_cut,
           cut_4: _scd3
         } = enzyme
       )
       when second_cut == 0 do
    dna_segment_size = byte_size(right)
    restriction_pattern_size = byte_size(pattern)

    cond do
      # This is the base case, we can't reduce the sequence further
      dna_segment_size <= restriction_pattern_size or dna_segment_size <= cut_site_offset ->
        [left <> right]

      dna_segment_size > restriction_pattern_size ->
        cut_site = 1 + cut_site_offset
        <<left_product::binary-size(cut_site), right_product::binary>> = right

        <<uncut::binary-size(1), check::binary-size(restriction_pattern_size), remaining::binary>> =
          right

        cond do
          pattern == check and left <> left_product != "" ->
            [
              left <> left_product,
              _digest("", right_product, enzyme)
            ]

          true ->
            _digest(left <> uncut, check <> remaining, enzyme)
        end
    end
  end
end
