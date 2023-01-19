defmodule BioIOFastqTest do
  use ExUnit.Case
  doctest Bio.IO.FastQ

  alias Bio.IO.FastQ, as: Subject

  test "reading with type dna" do
    expected = [
      {%Bio.Polymer.Dna{
         top: "aatagatgatagtag",
         bottom: "ttatctactatcatc",
         bottom_length: 15,
         top_length: 15,
         offset: 0,
         overhangs: %Bio.Polymer.Overhangs{
           top_left: "",
           top_right: "",
           bottom_left: "",
           bottom_right: ""
         },
         orientation: {5, 3},
         label: "header1"
       },
       %Bio.IO.QualityScore{
         scoring_characters: "FI?26E9+>=3$;)&",
         q_scores: [37, 40, 30, 17, 21, 36, 24, 10, 29, 28, 18, 3, 26, 8, 5],
         label: ""
       }},
      {%Bio.Polymer.Dna{
         top: "ggattaccagtgatgattgaa",
         bottom: "cctaatggtcactactaactt",
         bottom_length: 21,
         top_length: 21,
         offset: 0,
         overhangs: %Bio.Polymer.Overhangs{
           top_left: "",
           top_right: "",
           bottom_left: "",
           bottom_right: ""
         },
         orientation: {5, 3},
         label: "header2"
       },
       %Bio.IO.QualityScore{
         scoring_characters: "BA&\"!9:?8=EFH2#>+)064",
         q_scores: [33, 32, 5, 1, 0, 24, 25, 30, 23, 28, 36, 37, 39, 17, 2, 29, 10, 8, 15, 21, 19],
         label: ""
       }}
    ]

    {:ok, content} = Subject.read('test/io/fastq/fastq_1.fastq', type: :dna)

    assert content == expected
  end

  test "reading with type binary" do
    expected = [
      {
        {"aatagatgatagtag", "header1"},
        %Bio.IO.QualityScore{
          label: "",
          q_scores: [37, 40, 30, 17, 21, 36, 24, 10, 29, 28, 18, 3, 26, 8, 5],
          scoring_characters: "FI?26E9+>=3$;)&"
        }
      },
      {
        {"ggattaccagtgatgattgaa", "header2"},
        %Bio.IO.QualityScore{
          label: "",
          q_scores: [
            33,
            32,
            5,
            1,
            0,
            24,
            25,
            30,
            23,
            28,
            36,
            37,
            39,
            17,
            2,
            29,
            10,
            8,
            15,
            21,
            19
          ],
          scoring_characters: "BA&\"!9:?8=EFH2#>+)064"
        }
      }
    ]

    {:ok, content} = Subject.read('test/io/fastq/fastq_1.fastq', type: :binary)

    assert content == expected
  end

  test "reading with type default" do
    expected = [
      {
        %Bio.Polymer{label: "header1", length: 15, sequence: "aatagatgatagtag"},
        %Bio.IO.QualityScore{
          label: "",
          q_scores: [37, 40, 30, 17, 21, 36, 24, 10, 29, 28, 18, 3, 26, 8, 5],
          scoring_characters: "FI?26E9+>=3$;)&"
        }
      },
      {
        %Bio.Polymer{label: "header2", length: 21, sequence: "ggattaccagtgatgattgaa"},
        %Bio.IO.QualityScore{
          label: "",
          q_scores: [
            33,
            32,
            5,
            1,
            0,
            24,
            25,
            30,
            23,
            28,
            36,
            37,
            39,
            17,
            2,
            29,
            10,
            8,
            15,
            21,
            19
          ],
          scoring_characters: "BA&\"!9:?8=EFH2#>+)064"
        }
      }
    ]

    {:ok, content} = Subject.read('test/io/fastq/fastq_1.fastq')

    assert content == expected
  end
end
