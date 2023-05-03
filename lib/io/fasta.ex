defmodule Bio.IO.Fasta do
  @moduledoc """
  Allow the input/output of FASTA formatted files. Reads and writes fasta data
  to and from a number of formats.

  The FASTA file format is composed of pairs of lines where the pair is
  demarcated by the ">" character. All data proceeding the ">" character
  represents the 'header' of the pair, while the next line after a newline
  represents sequence data.

  The FASTA file format does not specify the type of the data in the sequence.
  That means that you can reasonably store RNA, DNA, amino acid, or
  realistically any other polymer sequence using the format. In general, the
  expectation is that the data is ASCII encoded.
  """

  @type header :: String.t()
  @type sequence :: String.t()
  @type read_opts ::
          {:type, any()}
          | {:parse_header, (String.t() -> String.t())}
  @type fasta_data ::
          [String.t()]
          | [struct()]
          | [{header(), sequence()}]
          | %{headers: [header()], sequences: [sequence()]}

  @doc """
  Read a FASTA formatted file

  The `read/2` function returns an error tuple of the content or error code from
  `File.read`. You can use `:file.format_error/1` to get a descriptive string of
  the error.

  You can specify the return type of the contents by using a module
  which matches the `Bio.Behaviours.Sequence`. Specifically the type must have a
  `new/2` method that matches the spec of the behaviour.

  ## Options
  - `:type` - The module for the type of struct you wish to have returned. This
  should minimally implement a `new/2` function equivalent to the
  `Bio.Behaviours.Sequence` behaviour.
  - `:parse_header` - A callable for parsing the header values of the FASTA
  file.
  """
  @spec read(filename :: Path.t(), opts :: [read_opts]) :: {:ok, any()} | {:error, File.posix()}
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

  @doc """
  Read a FASTA formatted file

  The same as `read/2`, but will raise a `File.Error` on failure.
  """
  @spec read!(filename :: Path.t(), opts :: [read_opts]) :: any() | no_return()
  def read!(filename, opts \\ []) do
    type = Keyword.get(opts, :type)
    h_fn = Keyword.get(opts, :parse_header, & &1)

    {:ok, parse(File.read!(filename), "", [], :header, type, h_fn)}
  end

  @doc """
  Write a FASTA file using sequence data.

  The data type that this function accepts is varied. Help with whatever your
  workflow requires, the `List` types are:

  List:
  ``` elixir
    [{header(), sequence()}, ...]
    [header(), sequence(), header(), sequence(), ...]
    [%Bio.Sequence._{}, ...]
  ```

  Where `%Bio.Sequence._{}` indicates any struct of the `Bio.Sequence` module or
  child modules implementing the `Bio.Behaviours.Sequence` behaviour.

  It also supports data in a `Map` format:

  ``` elixir
  %{
    headers: [header(), ...],
    sequences: [sequence(), ...]
  }
  ```

  ## Examples
      iex> Fasta.write("/tmp/test_file.fasta", ["header", "sequence", "header2", "sequence2"])
      :ok

  Will return error types in common with `File.write/3`
  """
  @spec write(filename :: Path.t(), data :: fasta_data, [File.mode()]) ::
          :ok | {:error, File.posix()}
  def write(filename, data, modes \\ [])

  def write(filename, {header, sequence}, modes) do
    File.write(filename, ">#{header}\n#{sequence}\n", modes)
  end

  def write(filename, [header, sequence], modes) do
    File.write(filename, ">#{header}\n#{sequence}\n", modes)
  end

  def write(filename, data, modes) when is_list(data) do
    [datum | _] = data

    data =
      if is_binary(datum) do
        data |> Enum.chunk_every(2)
      else
        data
      end

    data
    |> Enum.reduce("", &to_line/2)
    |> then(fn output -> File.write(filename, output, modes) end)
  end

  def write(filename, %{headers: headers, sequences: sequences}, modes) do
    Enum.zip(sequences, headers)
    |> Enum.reduce("", &to_line/2)
    |> then(fn output -> File.write(filename, output, modes) end)
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
