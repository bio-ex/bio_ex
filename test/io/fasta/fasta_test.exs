defmodule Testing.Tempfile do
  def get() do
    filename =
      :crypto.strong_rand_bytes(10)
      |> Base.encode64(padding: false)
      |> String.replace("/", "")

    tmp_dir = System.tmp_dir!()

    file_path =
      tmp_dir
      |> Path.join(filename)

    {tmp_dir, file_path}
  end

  def remove(dir) do
    File.rm_rf(dir)
  end
end

defmodule BioIOFastaTest do
  use ExUnit.Case
  doctest Bio.IO.Fasta

  alias Bio.IO.Fasta, as: Subject

  setup do
    {tmp_dir, tmp_file} = Testing.Tempfile.get()

    on_exit(fn ->
      Testing.Tempfile.remove(tmp_dir)
    end)

    [tmp_file: tmp_file]
  end

  test "reads a file" do
    expected_seq = "ataatatgatagtagatagatagtcctatga"

    {:ok, content} = Subject.read('test/io/fasta/test_1.fasta')

    assert content == [expected_seq, "header1"]
  end

  test "reads a multi-line file" do
    expected_seq = "ataatatgatagtagatagatagtcctatga"

    {:ok, content} = Subject.read('test/io/fasta/test_multi.fasta')

    assert content == [expected_seq, "header1"]
  end

  test "correctly read multiple sequences" do
    expected = [
      "atgcatgcatgcatgcatgcatgcatgcatg",
      "header5",
      "ccccccccccccccccccccccccccccccc",
      "header4",
      "ggggggggggggggggggggggggggggggg",
      "header3",
      "ttttttttttttttttttttttttttttttt",
      "header2",
      "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      "header1"
    ]

    {:ok, content} = Subject.read('test/io/fasta/test_5.fasta')

    assert content == expected
  end

  test "correctly writes sequences from list of tuples", context do
    input = [
      {
        "header1",
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      },
      {
        "header2",
        "ttttttttttttttttttttttttttttttt"
      },
      {
        "header3",
        "ggggggggggggggggggggggggggggggg"
      },
      {
        "header4",
        "ccccccccccccccccccccccccccccccc"
      },
      {
        "header5",
        "atgcatgcatgcatgcatgcatgcatgcatg"
      }
    ]

    expected = [
      "atgcatgcatgcatgcatgcatgcatgcatg",
      "header5",
      "ccccccccccccccccccccccccccccccc",
      "header4",
      "ggggggggggggggggggggggggggggggg",
      "header3",
      "ttttttttttttttttttttttttttttttt",
      "header2",
      "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      "header1"
    ]

    tmp = Map.get(context, :tmp_file)

    :ok = Subject.write(tmp, input)
    {:ok, re_read} = Subject.read(tmp)

    assert re_read == expected
  end

  test "correctly writes sequences from map with lists", context do
    input = %{
      headers: [
        "header1",
        "header2",
        "header3",
        "header4",
        "header5"
      ],
      sequences: [
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "ttttttttttttttttttttttttttttttt",
        "ggggggggggggggggggggggggggggggg",
        "ccccccccccccccccccccccccccccccc",
        "atgcatgcatgcatgcatgcatgcatgcatg"
      ]
    }

    expected = [
      "atgcatgcatgcatgcatgcatgcatgcatg",
      "header5",
      "ccccccccccccccccccccccccccccccc",
      "header4",
      "ggggggggggggggggggggggggggggggg",
      "header3",
      "ttttttttttttttttttttttttttttttt",
      "header2",
      "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      "header1"
    ]

    tmp = Map.get(context, :tmp_file)

    :ok = Subject.write(tmp, input)
    {:ok, re_read} = Subject.read(tmp)

    assert re_read == expected
  end

  test "correctly writes sequences from list", context do
    expected = [
      "header1",
      "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      "header2",
      "ttttttttttttttttttttttttttttttt",
      "header3",
      "ggggggggggggggggggggggggggggggg",
      "header4",
      "ccccccccccccccccccccccccccccccc",
      "header5",
      "atgcatgcatgcatgcatgcatgcatgcatg"
    ]

    tmp = Map.get(context, :tmp_file)

    Subject.write(tmp, expected)
    {:ok, re_read} = Subject.read(tmp)

    assert re_read == expected |> Enum.reverse()
  end

  test "correctly read multiple sequences over multiple lines" do
    expected = [
      "atgcatgcatgcatgcatgcatgcatgcatg",
      "header5",
      "ccccccccccccccccccccccccccccccc",
      "header4",
      "ggggggggggggggggggggggggggggggg",
      "header3",
      "ttttttttttttttttttttttttttttttt",
      "header2",
      "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      "header1"
    ]

    {:ok, content} = Subject.read('test/io/fasta/test_5_multi.fasta')

    assert content == expected
  end
end
