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
        type: :binary,
        parse_header: fn h -> h |> String.replace("header", "face") end
      )

    assert content == [{"ataatatgatagtagatagatagtcctatga", "face1"}]
  end

  test "reads a file into binary tuple" do
    {:ok, content} = Subject.read('test/io/fasta/test_1.fasta', type: :binary)

    assert content == [{"ataatatgatagtagatagatagtcctatga", "header1"}]
  end

  test "reads a file into default polymer" do
    {:ok, content} = Subject.read('test/io/fasta/test_1.fasta')

    assert content == [
             %Bio.Polymer{
               label: "header1",
               length: 31,
               sequence: "ataatatgatagtagatagatagtcctatga"
             }
           ]
  end

  test "reads a file into dna" do
    {:ok, content} = Subject.read('test/io/fasta/test_1.fasta', type: :dna)

    assert content == [
             %Bio.Polymer.Dna{
               label: "header1",
               bottom: "tattatactatcatctatctatcaggatact",
               bottom_length: 31,
               offset: 0,
               orientation: {5, 3},
               overhangs: %Bio.Polymer.Overhangs{
                 top_left: "",
                 top_right: "",
                 bottom_left: "",
                 bottom_right: ""
               },
               top: "ataatatgatagtagatagatagtcctatga",
               top_length: 31
             }
           ]
  end

  test "reads a file into amino acid" do
    {:ok, content} = Subject.read('test/io/fasta/test_1.fasta', type: :amino_acid)

    assert content == [
             %Bio.Polymer.AminoAcid{
               label: "header1",
               length: 31,
               sequence: "ataatatgatagtagatagatagtcctatga"
             }
           ]
  end

  test "reads a multi-line file" do
    {:ok, content} = Subject.read('test/io/fasta/test_multi.fasta')

    assert content == [
             %Bio.Polymer{
               sequence: "ataatatgatagtagatagatagtcctatga",
               length: 31,
               label: "header1"
             }
           ]
  end

  test "reads a multi-line file into dna" do
    {:ok, content} = Subject.read('test/io/fasta/test_multi.fasta', type: :dna)

    assert content == [
             %Bio.Polymer.Dna{
               label: "header1",
               bottom: "tattatactatcatctatctatcaggatact",
               bottom_length: 31,
               offset: 0,
               orientation: {5, 3},
               overhangs: %Bio.Polymer.Overhangs{
                 top_left: "",
                 top_right: "",
                 bottom_left: "",
                 bottom_right: ""
               },
               top: "ataatatgatagtagatagatagtcctatga",
               top_length: 31
             }
           ]
  end

  test "reads a multi-line file into amino acid" do
    {:ok, content} = Subject.read('test/io/fasta/test_multi.fasta', type: :amino_acid)

    assert content == [
             %Bio.Polymer.AminoAcid{
               sequence: "ataatatgatagtagatagatagtcctatga",
               length: 31,
               label: "header1"
             }
           ]
  end

  test "correctly read multiple sequences" do
    expected = [
      %Bio.Polymer{sequence: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", length: 31, label: "header1"},
      %Bio.Polymer{sequence: "ttttttttttttttttttttttttttttttt", length: 31, label: "header2"},
      %Bio.Polymer{sequence: "ggggggggggggggggggggggggggggggg", length: 31, label: "header3"},
      %Bio.Polymer{sequence: "ccccccccccccccccccccccccccccccc", length: 31, label: "header4"},
      %Bio.Polymer{sequence: "atgcatgcatgcatgcatgcatgcatgcatg", length: 31, label: "header5"}
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

    {:ok, content} = Subject.read('test/io/fasta/test_5.fasta', type: :binary)

    assert content == expected
  end

  test "correctly read multiple sequences dna" do
    expected = [
      %Bio.Polymer.Dna{
        label: "header1",
        bottom: "ttttttttttttttttttttttttttttttt",
        bottom_length: 31,
        offset: 0,
        orientation: {5, 3},
        overhangs: %Bio.Polymer.Overhangs{
          top_left: "",
          top_right: "",
          bottom_left: "",
          bottom_right: ""
        },
        top: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        top_length: 31
      },
      %Bio.Polymer.Dna{
        label: "header2",
        bottom: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        bottom_length: 31,
        offset: 0,
        orientation: {5, 3},
        overhangs: %Bio.Polymer.Overhangs{
          top_left: "",
          top_right: "",
          bottom_left: "",
          bottom_right: ""
        },
        top: "ttttttttttttttttttttttttttttttt",
        top_length: 31
      },
      %Bio.Polymer.Dna{
        label: "header3",
        bottom: "ccccccccccccccccccccccccccccccc",
        bottom_length: 31,
        offset: 0,
        orientation: {5, 3},
        overhangs: %Bio.Polymer.Overhangs{
          top_left: "",
          top_right: "",
          bottom_left: "",
          bottom_right: ""
        },
        top: "ggggggggggggggggggggggggggggggg",
        top_length: 31
      },
      %Bio.Polymer.Dna{
        label: "header4",
        bottom: "ggggggggggggggggggggggggggggggg",
        bottom_length: 31,
        offset: 0,
        orientation: {5, 3},
        overhangs: %Bio.Polymer.Overhangs{
          top_left: "",
          top_right: "",
          bottom_left: "",
          bottom_right: ""
        },
        top: "ccccccccccccccccccccccccccccccc",
        top_length: 31
      },
      %Bio.Polymer.Dna{
        label: "header5",
        bottom: "tacgtacgtacgtacgtacgtacgtacgtac",
        bottom_length: 31,
        offset: 0,
        orientation: {5, 3},
        overhangs: %Bio.Polymer.Overhangs{
          top_left: "",
          top_right: "",
          bottom_left: "",
          bottom_right: ""
        },
        top: "atgcatgcatgcatgcatgcatgcatgcatg",
        top_length: 31
      }
    ]

    {:ok, content} = Subject.read('test/io/fasta/test_5.fasta', type: :dna)

    assert content == expected
  end

  test "correctly read multiple sequences amino acid" do
    expected = [
      %Bio.Polymer.AminoAcid{
        sequence: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        length: 31,
        label: "header1"
      },
      %Bio.Polymer.AminoAcid{
        sequence: "ttttttttttttttttttttttttttttttt",
        length: 31,
        label: "header2"
      },
      %Bio.Polymer.AminoAcid{
        sequence: "ggggggggggggggggggggggggggggggg",
        length: 31,
        label: "header3"
      },
      %Bio.Polymer.AminoAcid{
        sequence: "ccccccccccccccccccccccccccccccc",
        length: 31,
        label: "header4"
      },
      %Bio.Polymer.AminoAcid{
        sequence: "atgcatgcatgcatgcatgcatgcatgcatg",
        length: 31,
        label: "header5"
      }
    ]

    {:ok, content} = Subject.read('test/io/fasta/test_5.fasta', type: :amino_acid)

    assert content == expected
  end
end

defmodule BioIOFastaTest.Write do
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
      %Bio.Polymer{sequence: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", length: 31, label: "header1"},
      %Bio.Polymer{sequence: "ttttttttttttttttttttttttttttttt", length: 31, label: "header2"},
      %Bio.Polymer{sequence: "ggggggggggggggggggggggggggggggg", length: 31, label: "header3"},
      %Bio.Polymer{sequence: "ccccccccccccccccccccccccccccccc", length: 31, label: "header4"},
      %Bio.Polymer{sequence: "atgcatgcatgcatgcatgcatgcatgcatg", length: 31, label: "header5"}
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
      %Bio.Polymer{sequence: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", length: 31, label: "header1"},
      %Bio.Polymer{sequence: "ttttttttttttttttttttttttttttttt", length: 31, label: "header2"},
      %Bio.Polymer{sequence: "ggggggggggggggggggggggggggggggg", length: 31, label: "header3"},
      %Bio.Polymer{sequence: "ccccccccccccccccccccccccccccccc", length: 31, label: "header4"},
      %Bio.Polymer{sequence: "atgcatgcatgcatgcatgcatgcatgcatg", length: 31, label: "header5"}
    ]

    tmp = Map.get(context, :tmp_file)

    :ok = Subject.write(tmp, input)
    {:ok, re_read} = Subject.read(tmp)

    assert re_read == expected
  end

  test "correctly writes sequences from list", context do
    expected = [
      %Bio.Polymer{sequence: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", length: 31, label: "header1"},
      %Bio.Polymer{sequence: "ttttttttttttttttttttttttttttttt", length: 31, label: "header2"},
      %Bio.Polymer{sequence: "ggggggggggggggggggggggggggggggg", length: 31, label: "header3"},
      %Bio.Polymer{sequence: "ccccccccccccccccccccccccccccccc", length: 31, label: "header4"},
      %Bio.Polymer{sequence: "atgcatgcatgcatgcatgcatgcatgcatg", length: 31, label: "header5"}
    ]

    tmp = Map.get(context, :tmp_file)

    Subject.write(tmp, expected)
    {:ok, re_read} = Subject.read(tmp)

    assert re_read == expected
  end

  test "correctly writes sequences from list of dna", context do
    write_out = [
      Bio.Polymer.Dna.from_binary("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", length: 31, label: "header1"),
      Bio.Polymer.Dna.from_binary("ttttttttttttttttttttttttttttttt", length: 31, label: "header2"),
      Bio.Polymer.Dna.from_binary("ggggggggggggggggggggggggggggggg", length: 31, label: "header3"),
      Bio.Polymer.Dna.from_binary("ccccccccccccccccccccccccccccccc", length: 31, label: "header4"),
      Bio.Polymer.Dna.from_binary("atgcatgcatgcatgcatgcatgcatgcatg", length: 31, label: "header5")
    ]

    expected = [
      %Bio.Polymer{sequence: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", length: 31, label: "header1"},
      %Bio.Polymer{sequence: "ttttttttttttttttttttttttttttttt", length: 31, label: "header2"},
      %Bio.Polymer{sequence: "ggggggggggggggggggggggggggggggg", length: 31, label: "header3"},
      %Bio.Polymer{sequence: "ccccccccccccccccccccccccccccccc", length: 31, label: "header4"},
      %Bio.Polymer{sequence: "atgcatgcatgcatgcatgcatgcatgcatg", length: 31, label: "header5"}
    ]

    tmp = Map.get(context, :tmp_file)

    Subject.write(tmp, write_out)
    {:ok, re_read} = Subject.read(tmp)
    {:ok, dna_read} = Subject.read(tmp, type: :dna)

    assert re_read == expected
    assert dna_read == write_out
  end
end
