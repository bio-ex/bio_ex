defmodule Bio.IO.FastQ do
  @moduledoc """
  Allow the input/output of FASTQ formatted files.

  This implementation references the documentation from
  [NCBI](https://www.ncbi.nlm.nih.gov/sra/docs/submitformats/#fastq-files) and
  uses the Phred scoring 33 offset by default.
  """
  @type quality_encoding :: :phred_33 | :phred_64 | :decimal

  alias Bio.IO.QualityScore

  @doc """
  Read a FASTQ formatted file into memory

  Returns a list of tuples where the first struct is the type from the `type`
  option, and the second is a `Bio.IO.QualityScore` struct.

  ## Options
  - `type` - The module for the Sequence type that you want the returned value
  in. Defaults to `Bio.Sequence.DnaStrand`. Module should implement the
  `Bio.Behaviours.Sequence` behaviour.
  - `quality_encoding` - Determines the encoding of the quality scores for
  adjusting the offset. Options are one of `t:Bio.IO.FastQ.quality_encoding/0`
  """
  @spec read(filename :: Path.t(), opts :: keyword()) ::
          {:ok, [{struct(), struct()}]} | {:error, File.posix()}
  def read(filename, opts \\ []) do
    type_module = Keyword.get(opts, :type, Bio.Sequence.DnaStrand)
    scoring = Keyword.get(opts, :quality_encoding, :phred_33)

    case File.read(filename) do
      {:ok, content} ->
        {
          :ok,
          content
          |> String.trim()
          |> parse("", [], :header, type_module, scoring)
        }

      not_ok ->
        not_ok
    end
  end

  defp parse("", value, acc, _ctx, type_module, scoring) do
    [value | acc]
    |> Enum.chunk_every(3)
    |> Enum.reduce([], fn [score, seq, label], acc ->
      sequence_struct = apply(type_module, :new, [seq, [label: label]])
      List.insert_at(acc, 0, {sequence_struct, QualityScore.new(score, encoding: scoring)})
    end)
  end

  defp parse(content, value, acc, ctx, type, scoring) when ctx == :header do
    <<char::binary-size(1), rest::binary>> = content

    case char do
      # Skip @ and continue as header
      "@" -> parse(rest, value, acc, :header, type, scoring)
      "\n" -> parse(rest, "", [value | acc], :sequence, type, scoring)
      _ -> parse(rest, value <> char, acc, :header, type, scoring)
    end
  end

  defp parse(content, value, acc, ctx, type, scoring) when ctx == :sequence do
    <<char::binary-size(1), rest::binary>> = content

    case char do
      # Skip newlines
      "\n" ->
        parse(rest, value, acc, :sequence, type, scoring)

      # Skip plus and send into scoring
      # Slice to remove the remaining newline
      "+" ->
        rest
        |> String.slice(1, byte_size(rest))
        |> parse("", [value | acc], :score, type, scoring)

      _ ->
        parse(rest, value <> char, acc, :sequence, type, scoring)
    end
  end

  defp parse(content, value, acc, ctx, type, scoring) when ctx == :score do
    <<char::binary-size(1), rest::binary>> = content

    case char do
      "\n" -> parse(rest, "", [value | acc], :header, type, scoring)
      _ -> parse(rest, value <> char, acc, :score, type, scoring)
    end
  end
end
