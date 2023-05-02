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

defmodule BioIOFastaTest.Read do
  use ExUnit.Case
  doctest Bio.IO.Fasta

  alias Bio.IO.Fasta, as: Subject
  alias Bio.Sequence.{DnaStrand, DnaDoubleStrand, AminoAcid, Sequence}

  setup do
    {tmp_dir, tmp_file} = Testing.Tempfile.get()

    on_exit(fn ->
      Testing.Tempfile.remove(tmp_dir)
    end)

    [tmp_file: tmp_file]
  end

  test "allows injecting callable to massage header data" do
    {:ok, content} =
      Subject.read('test/io/fasta/test_1.fasta',
        type: Subject.Binary,
        parse_header: fn h -> h |> String.replace("header", "face") end
      )

    assert content == [{"ataatatgatagtagatagatagtcctatga", "face1"}]
  end

  test "reads a file into binary tuple" do
    {:ok, content} = Subject.read('test/io/fasta/test_1.fasta', type: Subject.Binary)

    assert content == [{"ataatatgatagtagatagatagtcctatga", "header1"}]
  end

  test "reads a file into default polymer" do
    {:ok, content} = Subject.read('test/io/fasta/test_1.fasta')

    assert content == [
             %Bio.Sequence{
               label: "header1",
               length: 31,
               sequence: "ataatatgatagtagatagatagtcctatga"
             }
           ]
  end

  test "reads a file into dna" do
    {:ok, content} = Subject.read('test/io/fasta/test_1.fasta', type: DnaDoubleStrand)

    assert content == [
             Bio.Sequence.DnaDoubleStrand.new("ataatatgatagtagatagatagtcctatga", label: "header1")
           ]
  end

  test "reads a file into amino acid" do
    {:ok, content} = Subject.read('test/io/fasta/test_1.fasta', type: AminoAcid)

    assert content == [
             Bio.Sequence.AminoAcid.new("ataatatgatagtagatagatagtcctatga", label: "header1")
           ]
  end

  test "reads a multi-line file" do
    {:ok, content} = Subject.read('test/io/fasta/test_multi.fasta')

    assert content == [
             Bio.Sequence.new("ataatatgatagtagatagatagtcctatga", label: "header1")
           ]
  end

  test "reads a multi-line file into dna" do
    {:ok, content} = Subject.read('test/io/fasta/test_multi.fasta', type: DnaDoubleStrand)

    assert content == [
             Bio.Sequence.DnaDoubleStrand.new("ataatatgatagtagatagatagtcctatga", label: "header1")
           ]
  end

  test "reads a multi-line file into amino acid" do
    {:ok, content} = Subject.read('test/io/fasta/test_multi.fasta', type: AminoAcid)

    assert content == [
             %Bio.Sequence.AminoAcid{
               sequence: "ataatatgatagtagatagatagtcctatga",
               length: 31,
               label: "header1"
             }
           ]
  end

  test "correctly read multiple sequences" do
    expected = [
      %Bio.Sequence{sequence: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", length: 31, label: "header1"},
      %Bio.Sequence{sequence: "ttttttttttttttttttttttttttttttt", length: 31, label: "header2"},
      %Bio.Sequence{sequence: "ggggggggggggggggggggggggggggggg", length: 31, label: "header3"},
      %Bio.Sequence{sequence: "ccccccccccccccccccccccccccccccc", length: 31, label: "header4"},
      %Bio.Sequence{sequence: "atgcatgcatgcatgcatgcatgcatgcatg", length: 31, label: "header5"}
    ]

    {:ok, content} = Subject.read('test/io/fasta/test_5.fasta')

    assert content == expected
  end

  test "correctly read multiple sequences as binary" do
    expected = [
      {"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "header1"},
      {"ttttttttttttttttttttttttttttttt", "header2"},
      {"ggggggggggggggggggggggggggggggg", "header3"},
      {"ccccccccccccccccccccccccccccccc", "header4"},
      {"atgcatgcatgcatgcatgcatgcatgcatg", "header5"}
    ]

    {:ok, content} = Subject.read('test/io/fasta/test_5.fasta', type: Subject.Binary)

    assert content == expected
  end

  test "correctly read multiple sequences dna" do
    expected = [
      Bio.Sequence.DnaDoubleStrand.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", label: "header1"),
      Bio.Sequence.DnaDoubleStrand.new("ttttttttttttttttttttttttttttttt", label: "header2"),
      Bio.Sequence.DnaDoubleStrand.new("ggggggggggggggggggggggggggggggg", label: "header3"),
      Bio.Sequence.DnaDoubleStrand.new("ccccccccccccccccccccccccccccccc", label: "header4"),
      Bio.Sequence.DnaDoubleStrand.new("atgcatgcatgcatgcatgcatgcatgcatg", label: "header5")
    ]

    {:ok, content} = Subject.read('test/io/fasta/test_5.fasta', type: DnaDoubleStrand)

    assert content == expected
  end

  test "correctly read multiple sequences amino acid" do
    expected = [
      %Bio.Sequence.AminoAcid{
        sequence: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        length: 31,
        label: "header1"
      },
      %Bio.Sequence.AminoAcid{
        sequence: "ttttttttttttttttttttttttttttttt",
        length: 31,
        label: "header2"
      },
      %Bio.Sequence.AminoAcid{
        sequence: "ggggggggggggggggggggggggggggggg",
        length: 31,
        label: "header3"
      },
      %Bio.Sequence.AminoAcid{
        sequence: "ccccccccccccccccccccccccccccccc",
        length: 31,
        label: "header4"
      },
      %Bio.Sequence.AminoAcid{
        sequence: "atgcatgcatgcatgcatgcatgcatgcatg",
        length: 31,
        label: "header5"
      }
    ]

    {:ok, content} = Subject.read('test/io/fasta/test_5.fasta', type: AminoAcid)

    assert content == expected
  end
end

defmodule BioIOFastaTest.Write do
  use ExUnit.Case
  doctest Bio.IO.Fasta

  alias Bio.IO.Fasta, as: Subject
  alias Bio.Sequence.DnaStrand
  alias Bio.Sequence

  setup do
    {tmp_dir, tmp_file} = Testing.Tempfile.get()

    on_exit(fn ->
      Testing.Tempfile.remove(tmp_dir)
    end)

    [tmp_file: tmp_file]
  end

  test "correctly writes sequences from list of tuples", context do
    input = [
      "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      "header1",
      "ttttttttttttttttttttttttttttttt",
      "header2",
      "ggggggggggggggggggggggggggggggg",
      "header3",
      "ccccccccccccccccccccccccccccccc",
      "header4",
      "atgcatgcatgcatgcatgcatgcatgcatg",
      "header5"
    ]

    expected = [
      Sequence.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", label: "header1"),
      Sequence.new("ttttttttttttttttttttttttttttttt", label: "header2"),
      Sequence.new("ggggggggggggggggggggggggggggggg", label: "header3"),
      Sequence.new("ccccccccccccccccccccccccccccccc", label: "header4"),
      Sequence.new("atgcatgcatgcatgcatgcatgcatgcatg", label: "header5")
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
      Sequence.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", label: "header1"),
      Sequence.new("ttttttttttttttttttttttttttttttt", label: "header2"),
      Sequence.new("ggggggggggggggggggggggggggggggg", label: "header3"),
      Sequence.new("ccccccccccccccccccccccccccccccc", label: "header4"),
      Sequence.new("atgcatgcatgcatgcatgcatgcatgcatg", label: "header5")
    ]

    tmp = Map.get(context, :tmp_file)

    :ok = Subject.write(tmp, input)
    {:ok, re_read} = Subject.read(tmp)

    assert re_read == expected
  end

  test "correctly writes sequences from list", context do
    expected = [
      Sequence.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", label: "header1"),
      Sequence.new("ttttttttttttttttttttttttttttttt", label: "header2"),
      Sequence.new("ggggggggggggggggggggggggggggggg", label: "header3"),
      Sequence.new("ccccccccccccccccccccccccccccccc", label: "header4"),
      Sequence.new("atgcatgcatgcatgcatgcatgcatgcatg", label: "header5")
    ]

    tmp = Map.get(context, :tmp_file)

    Subject.write(tmp, expected)
    {:ok, re_read} = Subject.read(tmp)

    assert re_read == expected
  end

  test "correctly writes sequences from list of dna", context do
    write_out = [
      DnaStrand.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", label: "header1"),
      DnaStrand.new("ttttttttttttttttttttttttttttttt", label: "header2"),
      DnaStrand.new("ggggggggggggggggggggggggggggggg", label: "header3"),
      DnaStrand.new("ccccccccccccccccccccccccccccccc", label: "header4"),
      DnaStrand.new("atgcatgcatgcatgcatgcatgcatgcatg", label: "header5")
    ]

    expected = [
      Sequence.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", label: "header1"),
      Sequence.new("ttttttttttttttttttttttttttttttt", label: "header2"),
      Sequence.new("ggggggggggggggggggggggggggggggg", label: "header3"),
      Sequence.new("ccccccccccccccccccccccccccccccc", label: "header4"),
      Sequence.new("atgcatgcatgcatgcatgcatgcatgcatg", label: "header5")
    ]

    tmp = Map.get(context, :tmp_file)

    Subject.write(tmp, write_out)
    {:ok, re_read} = Subject.read(tmp)
    {:ok, dna_read} = Subject.read(tmp, type: DnaStrand)

    assert re_read == expected
    assert dna_read == write_out
  end
end
