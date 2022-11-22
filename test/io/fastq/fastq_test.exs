defmodule BioIOFastqTest do
  use ExUnit.Case
  doctest Bio.Io.FastQ

  alias Bio.Io.FastQ, as: Subject

  test "reads a file" do
    expected = [
      "-g59514c&%t!at!attgaa",
      "ggattaccagtgatgattgaa",
      "header2",
      "{1t,g/taatAgtAg",
      "aatagatgatagtag",
      "header1"
    ]

    {:ok, content} = Subject.read('test/io/fastq/fastq_1.fastq')

    assert content == expected
  end
end
