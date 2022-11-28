defmodule Bio.IO.FastQ do
  @moduledoc """
  Allow the input/output of FASTQ formatted files.

  Similar to `Bio.IO.Fasta`, this will recursively read the file contents into a
  simple List. This list will be in the format of:
  [score, sequence, header]
  In the reverse order of the appearance in the original file.
  """

  @doc """
  Read a FASTQ formatted file into memory
  """
  def read(filename) do
    case File.read(filename) do
      {:ok, content} ->
        {:ok, content |> String.trim() |> parse("", [], :header)}

      not_ok ->
        not_ok
    end
  end

  defp parse(content, value, acc, _ctx) when content == "" do
    [value | acc]
  end

  defp parse(content, value, acc, ctx) when ctx == :header do
    <<char::binary-size(1), rest::binary>> = content

    case char do
      # Skip @ and continue as header
      "@" -> parse(rest, value, acc, :header)
      "\n" -> parse(rest, "", [value | acc], :sequence)
      _ -> parse(rest, value <> char, acc, :header)
    end
  end

  defp parse(content, value, acc, ctx) when ctx == :sequence do
    <<char::binary-size(1), rest::binary>> = content

    case char do
      # Skip newlines
      "\n" -> parse(rest, value, acc, :sequence)
      # Skip plus and send into scoring
      # Slice to remove the remaining newline
      "+" -> rest |> String.slice(1, byte_size(rest)) |> parse("", [value | acc], :score)
      _ -> parse(rest, value <> char, acc, :sequence)
    end
  end

  defp parse(content, value, acc, ctx) when ctx == :score do
    <<char::binary-size(1), rest::binary>> = content

    case char do
      "\n" -> parse(rest, "", [value | acc], :header)
      _ -> parse(rest, value <> char, acc, :score)
    end
  end
end
