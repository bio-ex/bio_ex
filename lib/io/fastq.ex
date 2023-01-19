defmodule Bio.IO.FastQ do
  @moduledoc """
  Allow the input/output of FASTQ formatted files.

  Similar to `Bio.IO.Fasta`, this will recursively read the file contents into a
  simple List. This list will be in the format of:
  [score, sequence, header]
  In the reverse order of the appearance in the original file.

  TODO: I think that I should have essentially the same format as the fasta but
  with the returned list being tuples of {thing, score}
  """

  import Bio.IO.Utilities

  @doc """
  Read a FASTQ formatted file into memory
  """
  def read(filename, opts \\ []) do
    case File.read(filename) do
      {:ok, content} ->
        {:ok, content |> String.trim() |> parse("", [], :header, Keyword.get(opts, :type))}

      not_ok ->
        not_ok
    end
  end

  defp parse("", value, acc, _ctx, type) do
    [value | acc]
    |> Enum.chunk_every(3)
    |> Enum.reduce([], fn [score, seq, label], acc ->
      List.insert_at(acc, 0, {sequence(type, seq, label), Bio.IO.QualityScore.from_binary(score)})
    end)
  end

  defp parse(content, value, acc, ctx, type) when ctx == :header do
    <<char::binary-size(1), rest::binary>> = content

    case char do
      # Skip @ and continue as header
      "@" -> parse(rest, value, acc, :header, type)
      "\n" -> parse(rest, "", [value | acc], :sequence, type)
      _ -> parse(rest, value <> char, acc, :header, type)
    end
  end

  defp parse(content, value, acc, ctx, type) when ctx == :sequence do
    <<char::binary-size(1), rest::binary>> = content

    case char do
      # Skip newlines
      "\n" ->
        parse(rest, value, acc, :sequence, type)

      # Skip plus and send into scoring
      # Slice to remove the remaining newline
      "+" ->
        rest
        |> String.slice(1, byte_size(rest))
        |> parse("", [value | acc], :score, type)

      _ ->
        parse(rest, value <> char, acc, :sequence, type)
    end
  end

  defp parse(content, value, acc, ctx, type) when ctx == :score do
    <<char::binary-size(1), rest::binary>> = content

    case char do
      "\n" -> parse(rest, "", [value | acc], :header, type)
      _ -> parse(rest, value <> char, acc, :score, type)
    end
  end
end
