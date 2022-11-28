defmodule BioIOFastaTest do
  use ExUnit.Case
  doctest Bio.IO.Fasta

  alias Bio.IO.Fasta, as: Subject

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
