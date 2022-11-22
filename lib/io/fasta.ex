defmodule Bio.Io.Fasta do
  @moduledoc """
  Allow the input/output of FASTA formatted files.

  Reads out the FASTA data into a basic list by recursion. In order to allow
  maximum flexibility, the list is completely un-touched, so that the size of
  the file is the only thing that determines the runtime of the `read`
  operation.

  Because of that, the order is naturally reversed. The list will contain N
  sequences and N headers in reverse order, as:
  [Seq_n, Head_n, Seq_n-1, Head_n-1]

  So if you have the following FASTA file:

  ```
  >header1
  atgc
  >header2
  gtac
  ```

  Then you would expect to get the following:

  ["gtac", "header2", "atgc", "header1"]

  This is the lightest weight way to make this functional
  """

  @doc """
  Read a FASTA formatted file into memory
  """
  def read(filename) do
    case File.read(filename) do
      {:ok, content} ->
        {:ok, parse(content, "", [], :header)}

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
      ">" -> parse(rest, value, acc, :header)
      "\n" -> parse(rest, "", [value | acc], :sequence)
      _ -> parse(rest, value <> char, acc, :header)
    end
  end

  defp parse(content, value, acc, ctx) when ctx == :sequence do
    <<char::binary-size(1), rest::binary>> = content

    case char do
      ">" -> parse(rest, "", [value | acc], :header)
      "\n" -> parse(rest, value, acc, :sequence)
      _ -> parse(rest, value <> char, acc, :sequence)
    end
  end
end
