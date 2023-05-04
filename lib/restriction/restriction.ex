defmodule Bio.Restriction do
  @moduledoc """
  Functions related to restriction enzyme data.

  The primary function is `digest`. The `digest` function works by recursively
  breaking down a binary and checking to see if the pattern for a given enzyme
  exists within it.

  > #### Note {: .neutral}
  > Currently we don't support enzymes that have two cut sites, or
  > enzymes with ambiguous DNA recognition.

  Restriction is also the namespace for `Enzyme`, where functions for accessing
  all the downloaded restriction enzyme data lives. Inside of
  `Bio.Restriction.Enzyme` there is a struct defined. Each method named in the
  lowercase fashion of the restriction enzymes returns an instance of this
  struct.

  The enzyme HpyUM037X is removed from the set, since it has two conflicting
  entries in the emboss data. If you can resolve this distinction, please feel
  free to either contribute a fix, or open an issue that explains how one would
  be implemented.

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
