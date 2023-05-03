defmodule Bio.IO.Fasta do
  @moduledoc """
  Allow the input/output of FASTA formatted files. Reads and writes fasta data
  to and from a number of formats.
  """

  @doc """
  """
  def read(filename, opts \\ []) do
    type = Keyword.get(opts, :type, Bio.Sequence)
    h_fn = Keyword.get(opts, :parse_header, & &1)

    case File.read(filename) do
      {:ok, content} ->
        {:ok, parse(content, "", [], :header, type, h_fn)}

      not_ok ->
        not_ok
    end
  end

  def read!(filename, opts \\ []) do
    type = Keyword.get(opts, :type)
    h_fn = Keyword.get(opts, :parse_header, & &1)

    {:ok, parse(File.read!(filename), "", [], :header, type, h_fn)}
  end

  @doc """
  Write a file with FASTA data
  You can give a list or map
  List:
    [{header, sequence}, ....]
    [header, sequence, header, sequence ....]
    [Struct, Struct]
  The write function supports a few different primitive structures of data,
  including:
  - flat list `["header", "seq", ...]`
  - list of tuples `[{header, seq}, ...]`
  - a map `%{headers: String[], sequences: String[]}`
  ## Examples
      iex> Bio.IO.Fasta.write("/tmp/test_file.fasta", ["header", "sequence", "header2", "sequence2"])
      :ok
  """
  def write(filename, {header, sequence}) do
    File.write(filename, ">#{header}\n#{sequence}\n")
  end

  def write(filename, [header, sequence]) do
    File.write(filename, ">#{header}\n#{sequence}\n")
  end

  def write(filename, data) when is_list(data) do
    [datum | _] = data

    data =
      if is_binary(datum) do
        data |> Enum.chunk_every(2)
      else
        data
      end

    data
    |> Enum.reduce("", &to_line/2)
    |> then(fn output -> File.write(filename, output) end)
  end

  def write(filename, %{headers: headers, sequences: sequences}) do
    Enum.zip(sequences, headers)
    |> Enum.reduce("", &to_line/2)
    |> then(fn output -> File.write(filename, output) end)
  end

  defp parse(content, value, acc, _ctx, type, header_fn) when content == "" do
    # this will be [seq, header] for all the parsed seqs
    [value | acc]
    |> Enum.chunk_every(2)
    |> Enum.reduce([], fn [seq, header], acc ->
      List.insert_at(acc, 0, apply(type, :new, [seq, [label: header_fn.(header)]]))
    end)
  end

  defp parse(content, value, acc, ctx, type, header_fn) when ctx == :header do
    <<char::binary-size(1), rest::binary>> = content

    case char do
      ">" -> parse(rest, value, acc, :header, type, header_fn)
      "\n" -> parse(rest, "", [value | acc], :sequence, type, header_fn)
      _ -> parse(rest, value <> char, acc, :header, type, header_fn)
    end
  end

  defp parse(content, value, acc, ctx, type, header_fn) when ctx == :sequence do
    <<char::binary-size(1), rest::binary>> = content

    case char do
      ">" -> parse(rest, "", [value | acc], :header, type, header_fn)
      "\n" -> parse(rest, value, acc, :sequence, type, header_fn)
      _ -> parse(rest, value <> char, acc, :sequence, type, header_fn)
    end
  end

  defp to_line([sequence, header], acc) do
    acc <> ">#{header}\n#{sequence}\n"
  end

  defp to_line({sequence, header}, acc) do
    acc <> ">#{header}\n#{sequence}\n"
  end

  defp to_line(%_{} = datum, acc) do
    acc <> apply(datum.__struct__, :fasta_line, [datum])
  end

  defmodule Binary do
    @moduledoc false

    @doc false
    def new(sequence, label: label), do: {sequence, label}
  end
end
