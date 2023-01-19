defmodule Bio.IO.Fasta do
  @moduledoc """
  Allow the input/output of FASTA formatted files.

  Reads and writes fasta data to and from a number of formats.

  Simple Binary
  You can read the data into a simple binary tuple of

  {sequence, header}

  Where the values are not processed any further.

  As a `%Bio.Polymer{}` (default behavior)
  The default (no option given) type for the sequence is the `Bio.Polymer`. This
  is largely because I expect most people to use the `Polymer` struct as the
  workhorse of their analytics. Specific structures only become necessary in
  niches.

  Headers are assumed to be labels, unless the `parse_header` option is given
  which is a callable for parsing the data that may be encoded in the header
  lines of the FASTA file.

  As a `%Bio.Polymer.Dna{}` struct

  As a `%Bio.Polymer.AminoAcid{}` struct

  As a `Bio.Polymer.Rna` struct

  `Bio.IO.Fasta.write/2` will take lists of any of these for writing
  Additionally, it is able to handle a list of tuples:

  [{sequence, header}]

  A Map with keys `sequences` and `headers` where each is a list of binaries.

  %{sequences: [...], headers: [...]}

  Or a flat list where the elements are intermittent sequence/header pairs

  [sequence1, header1, sequence2, header2, ... sequenceN, headerN]
  """

  import Bio.IO.Utilities

  @doc """
  Read a FASTA formatted file into memory

  You may read into naive data-types (strings) or you can pass in an option for
  the `type` parameter which will determine which `Bio.Polymer` struct to read
  into. The options according to the structs available are:

  `binary`: `:binary`
  `Bio.Polymer`: default
  `Bio.Polymer.Dna`: `:dna`
  `Bio.Polymer.Rna`: `:rna`
  `Bio.Polymer.AminoAcid`: `:amino_acid`
  """
  def read(filename, opts \\ []) do
    type = Keyword.get(opts, :type)
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
      List.insert_at(acc, 0, sequence(type, seq, header_fn.(header)))
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

  defp to_line(%Bio.Polymer.Dna{} = datum, acc) do
    acc <> ">#{datum.label}\n#{datum.top}\n"
  end

  defp to_line(%Bio.Polymer.Rna{} = datum, acc) do
    acc <> ">#{datum.label}\n#{datum.top}\n"
  end

  defp to_line(%Bio.Polymer.AminoAcid{} = datum, acc) do
    acc <> ">#{datum.label}\n#{datum.sequence}\n"
  end

  defp to_line(%Bio.Polymer{} = datum, acc) do
    acc <> ">#{datum.label}\n#{datum.sequence}\n"
  end
end
