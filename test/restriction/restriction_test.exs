# Assertions should be given as Actual == Expected
defmodule RestrictionTest do
  use ExUnit.Case
  doctest Bio.Restriction

  @doc """
  BsmBI
  pattern: cgtctc
  cut offset: 7

  tta cgtctc agtagc
      123456 1

  ttacgtctca ^ gtagc
  """
  test "digest works with bsmbi" do
    initial = "ttacgtctcagtagc"

    output =
      initial
      |> Bio.Restriction.digest(Bio.Restriction.Enzyme.bsmbi())

    assert output == ["ttacgtctca", "gtagc"]
    assert List.to_string(output) == initial
  end

  @doc """
  BsmBI - multi
  pattern: cgtctc
  cut offset: 7

  tta cgtctc agtagctta cgtctc agtagc
      123456 1         123456 1

  ttacgtctca ^ gtagcttacgtctca ^ gtagc
  """
  test "digest works with multiple bsmbi" do
    initial = "ttacgtctcagtagcttacgtctcagtagc"

    output =
      initial
      |> Bio.Restriction.digest(Bio.Restriction.Enzyme.bsmbi())

    assert List.to_string(output) == initial
    assert output == ["ttacgtctca", "gtagcttacgtctca", "gtagc"]
  end

  @doc """
  PaqCI
  pattern: cacctgc
  cut offset: 11

  tagcctcttacg cacctgc cctgcgcttaggacgatagttgagt
               1234567 1234

  tagcctcttacgcacctgccctg ^ cgcttaggacgatagttgagt
  """
  test "digest works with paqci" do
    initial = "tagcctcttacgcacctgccctgcgcttaggacgatagttgagt"

    output =
      initial
      |> Bio.Restriction.digest(Bio.Restriction.Enzyme.paqci())

    assert List.to_string(output) == initial
    assert output == ["tagcctcttacgcacctgccctg", "cgcttaggacgatagttgagt"]
  end

  @doc """
  PaqCI - near end
  pattern: cacctgc
  cut offset: 11

  tagcctcttacgcccgccctgcgcttaggacgatag cacctgc ttt
                                       1234567 1234

  tagcctcttacgcccgccctgcgcttaggacgatagcacctgcttt

  We shouldn't cut because the enzyme wouldn't be able to.
  """
  test "digest works with paqci too close to end" do
    initial = "tagcctcttacgcccgccctgcgcttaggacgatagcacctgcttt"

    output =
      initial
      |> Bio.Restriction.digest(Bio.Restriction.Enzyme.paqci())

    assert List.to_string(output) == initial
    assert output == ["tagcctcttacgcccgccctgcgcttaggacgatagcacctgcttt"]
  end

  @doc """
  pattern: ggcc,
  cut offset: -1,

  tagcctcttacg ggcccctgcgcttaggacgatagttgagt
             1 1234567

  tagcctcttac gggcccctgcgcttaggacgatagttgagt
  """
  test "digest works with aoxi" do
    starting = "tagcctcttacgggcccctgcgcttaggacgatagttgagt"

    output =
      starting
      |> Bio.Restriction.digest(Bio.Restriction.Enzyme.aoxi())

    assert List.to_string(output) == starting
    assert output == ["tagcctcttac", "gggcccctgcgcttaggacgatagttgagt"]
  end

  @doc """
  pattern: ggcc,
  cut offset: -1,

  tagcctcttacg ggcccctgcgcttaggacgatagttgagttagcctcttacg ggcccctgcgcttaggacgatagttgagt
             1 1234                                    1 1234

  tagcctcttac ^ gggcccctgcgcttaggacgatagttgagttagcctcttac ^ gggcccctgcgcttaggacgatagttgagt
  """
  test "digest works with multiple sites aoxi" do
    starting =
      "tagcctcttacgggcccctgcgcttaggacgatagttgagttagcctcttacgggcccctgcgcttaggacgatagttgagt"

    output =
      starting
      |> Bio.Restriction.digest(Bio.Restriction.Enzyme.aoxi())

    assert List.to_string(output) == starting

    assert output == [
             "tagcctcttac",
             "gggcccctgcgcttaggacgatagttgagttagcctcttac",
             "gggcccctgcgcttaggacgatagttgagt"
           ]
  end

  @tag :performance
  test "large sequence with aoxi" do
    initial =
      "ttgccgcggtcgtatacacaccggacggacacaagtatgtactaggaatggatcgaagcacgtgcactcatgctactcctttcacatacttggataacagcaatgttgaccacgttaagatctttacccgacctcgttgattcgtctcttcaagggaggagtccgaacaaattccgaactatttccttgcacattcgatcaggtcaatgcctcgtcccggctgaggagatagtcatgagatctcaaatgaatagggagggaaaatgagtgattagcgcgaaactatgtggtatcacagtttgtggagtctaaacgcagcagctgtttaactactcgctcaatcccgaaacgcggtgatagagcaacccattatgccgtgtgccgagggttacgtgtgccgcaattagcgtgggtaactatgacttttttgaggggaagctaagtccacctatacgaaagatgtgccgaacggctcaaacggcgtagagttcgtcttctcccgacggctaagcgaccctacattgggagactaagcggaagttgctcgaacagtcttgcaactatggtaaataattcttcacctcccagtccctcacgatcgattgttcctcgtgaagcagagctaatgtccccttactgctcgaccctactcgcagcgagcggcaatagcggggaactcgttaataagaggcagctcccacaatcaggtatggtctcacgctatgaatcggggcgacggactcgataatgggaacatgttgtgtgagggacgtaaactagatatcaggaagctaagtgtcctgatcggatcaatgattgttgaccaggtcagtctaattcgtatttgacaaaaacccgttggggcgtacctagtacctccccccaaccagctcccgacgaccgctacgctcgacattagaccgccgcgacctactgagatctatgggtctatacgggatttctgcgggactatcgacccgagcctcgccgctgaacctgctgcgggccttatcccgcatagacgtggcggaccagctcagcgctttggggcggttaaagacctgcacaaagatctggagctcgggctcagagggccccaggggattatagggtacttgcaaggtaaatacatgggaaagtgacgagcgggccttgtctcatacaaactacaagcgaacggatagatccctgtgtcccaaagtcacttcgggcgagtcgtagttaagattgagaccttaggcccgaataaggggctcctgaggccactctaataatgactaaagcccatcgtgatcataacaacttgtggactagtgcctgttaggatttgccacaagtgtcactcatggtcagcgcgggcgtgccgacgatcaacgaggagagcacttgtcagggtgctccatagggacggtatggaagacaacaaattcctcacagagaagttctcaaagatttttcttcaaagcgcccccggtggaatgagagatgattgggctctaat"

    expected = [
      "ttgccgcggtcgtatacacaccggacggacacaagtatgtactaggaatggatcgaagcacgtgcactcatgctactcctttcacatacttggataacagcaatgttgaccacgttaagatctttacccgacctcgttgattcgtctcttcaagggaggagtccgaacaaattccgaactatttccttgcacattcgatcaggtcaatgcctcgtcccggctgaggagatagtcatgagatctcaaatgaatagggagggaaaatgagtgattagcgcgaaactatgtggtatcacagtttgtggagtctaaacgcagcagctgtttaactactcgctcaatcccgaaacgcggtgatagagcaacccattatgccgtgtgccgagggttacgtgtgccgcaattagcgtgggtaactatgacttttttgaggggaagctaagtccacctatacgaaagatgtgccgaacggctcaaacggcgtagagttcgtcttctcccgacggctaagcgaccctacattgggagactaagcggaagttgctcgaacagtcttgcaactatggtaaataattcttcacctcccagtccctcacgatcgattgttcctcgtgaagcagagctaatgtccccttactgctcgaccctactcgcagcgagcggcaatagcggggaactcgttaataagaggcagctcccacaatcaggtatggtctcacgctatgaatcggggcgacggactcgataatgggaacatgttgtgtgagggacgtaaactagatatcaggaagctaagtgtcctgatcggatcaatgattgttgaccaggtcagtctaattcgtatttgacaaaaacccgttggggcgtacctagtacctccccccaaccagctcccgacgaccgctacgctcgacattagaccgccgcgacctactgagatctatgggtctatacgggatttctgcgggactatcgacccgagcctcgccgctgaacctgctgc",
      "gggccttatcccgcatagacgtggcggaccagctcagcgctttggggcggttaaagacctgcacaaagatctggagctcgggctcaga",
      "gggccccaggggattatagggtacttgcaaggtaaatacatgggaaagtgacgagc",
      "gggccttgtctcatacaaactacaagcgaacggatagatccctgtgtcccaaagtcacttcgggcgagtcgtagttaagattgagacctt",
      "aggcccgaataaggggctcctg",
      "aggccactctaataatgactaaagcccatcgtgatcataacaacttgtggactagtgcctgttaggatttgccacaagtgtcactcatggtcagcgcgggcgtgccgacgatcaacgaggagagcacttgtcagggtgctccatagggacggtatggaagacaacaaattcctcacagagaagttctcaaagatttttcttcaaagcgcccccggtggaatgagagatgattgggctctaat"
    ]

    output =
      initial
      |> Bio.Restriction.digest(Bio.Restriction.Enzyme.aoxi())

    assert List.to_string(output) == initial
    assert output == expected
  end

  @tag :performance
  test "large sequence with bsmbi" do
    output =
      "cggaacatggcgtgccctaccggctataccgactgtctgagtcctctagggttcgtaatgacgccacccttagggtatacgggcagtaccacagtcaaatatttcaccagtctcctgtactcggaccttttaacgtcgatcaatgacagcaattttcgccatggtaggatttcccggtttgagcgtgagtcgattgccaggggcggagactaaagcgtttgctactcggcttggtctggatatcatttggagtgcgccaacttcagatccacctattgctgccgaaggagacggcgctcaagaacaccccatgttacccccgagatacgaggaagaagccggttagttggtttcagggcactgggaactctactgggctggtaagaggtatacaatatgtttgtgcctgcatgtataagccacagcctactctacaaagtggcgaagccacccacgggactgcgatcagggaggggttagccacagtccatgtattcagttgatacggatgtcagttagttggctcgcggtcgtcacagcggaagcatgcttcccgggctgggcttctgtagactctccatccggatgtgatctgatttttggtaaccacagatttcacagaggaggaagaacgggcaatatcctagcccgggaacagctgtctggttcgcgttcattaacacaccagctgcaaaacctcagaaagaattatgtgtctcacgaagcgtgtcgtagatgcctatcagcgtgcgcttagttggcacgggtggggccgactaggtactaggaacccttgcaatttcagggggacttagaaaggtccgtattggacagtagtccagaccctgagtgtgtatcaattggcttgcatagccattcaggtaatagctgtgcgtctccgaggactttctttctccggagtactggctctgtggatctcaactcatacacttgataataagtatccggcgcctgcgaagtctgccaacaactgtgtggcatttgccaagcggtcatgcttcggaatcacccgaagtttaaaatgcacttagaatgcctatcgttaacacagattcgcgaaggcgactgttggggaccgcgcttcaacgcaaggtactgtcgtcttcttggactacagagcgcgatacacacctgagtatagaaaaggtcaccgttttgtaacgcctggacctatagggtgacgggtttgcctcgactgtccgctttccactaaaaacagaaacttatcgtccatggtgacgtctgtttgtcaggtggttctggacgatcgccctgggaggattcaaatagttttgatctaccgcctcgtcggaaaccggtaccagagctaatgacaaattacggcccacccctgaataagtggtgtgaacggcctgcccgttgagtaacccccgcgtgagcatttgtgacgtctgaagtcgctcaaccgcgactacgtttattacacgggtataatttactgctcgcacatgtaaacggt"
      |> Bio.Restriction.digest(Bio.Restriction.Enzyme.bsmbi())

    expected = [
      "cggaacatggcgtgccctaccggctataccgactgtctgagtcctctagggttcgtaatgacgccacccttagggtatacgggcagtaccacagtcaaatatttcaccagtctcctgtactcggaccttttaacgtcgatcaatgacagcaattttcgccatggtaggatttcccggtttgagcgtgagtcgattgccaggggcggagactaaagcgtttgctactcggcttggtctggatatcatttggagtgcgccaacttcagatccacctattgctgccgaaggagacggcgctcaagaacaccccatgttacccccgagatacgaggaagaagccggttagttggtttcagggcactgggaactctactgggctggtaagaggtatacaatatgtttgtgcctgcatgtataagccacagcctactctacaaagtggcgaagccacccacgggactgcgatcagggaggggttagccacagtccatgtattcagttgatacggatgtcagttagttggctcgcggtcgtcacagcggaagcatgcttcccgggctgggcttctgtagactctccatccggatgtgatctgatttttggtaaccacagatttcacagaggaggaagaacgggcaatatcctagcccgggaacagctgtctggttcgcgttcattaacacaccagctgcaaaacctcagaaagaattatgtgtctcacgaagcgtgtcgtagatgcctatcagcgtgcgcttagttggcacgggtggggccgactaggtactaggaacccttgcaatttcagggggacttagaaaggtccgtattggacagtagtccagaccctgagtgtgtatcaattggcttgcatagccattcaggtaatagctgtgcgtctcc",
      "gaggactttctttctccggagtactggctctgtggatctcaactcatacacttgataataagtatccggcgcctgcgaagtctgccaacaactgtgtggcatttgccaagcggtcatgcttcggaatcacccgaagtttaaaatgcacttagaatgcctatcgttaacacagattcgcgaaggcgactgttggggaccgcgcttcaacgcaaggtactgtcgtcttcttggactacagagcgcgatacacacctgagtatagaaaaggtcaccgttttgtaacgcctggacctatagggtgacgggtttgcctcgactgtccgctttccactaaaaacagaaacttatcgtccatggtgacgtctgtttgtcaggtggttctggacgatcgccctgggaggattcaaatagttttgatctaccgcctcgtcggaaaccggtaccagagctaatgacaaattacggcccacccctgaataagtggtgtgaacggcctgcccgttgagtaacccccgcgtgagcatttgtgacgtctgaagtcgctcaaccgcgactacgtttattacacgggtataatttactgctcgcacatgtaaacggt"
    ]

    assert output == expected
  end

  @tag :performance
  test "large sequence with asi256i" do
    output =
      "cgagcgcttcgtaagtcggacgaaagaaaaaggtgatcaatagcatatcgtcttctgggaatccaccgtagccgatgctgtagcagtaaggtttgctacccattcgggtaaggccgctttgcaagttctttttggtacgcatgccgcgtggtaagggtgtcacagtgcacacattctcccatctaagtagttctatagaaaaacggttgggactagtaaatactgtagacaagtgacttatacaatcgtgccaggacgctgtgggtacgattcagttcgatctcttatacactcgtgcaatgtcgatcaattaagtaaaacaagagacttttagtgcatctttgggatcggtaagctgtcgtaagtacattttgcgcaatcttggtatatcccctcacgccgtccgatacgactacgcatgctgacgttagcttgttggagatggtgaaaaaaggtctgttggaaggccgtggccagtcgcacaacatcatataagattctccgtttatgttgtgtagagtcacatatattccggcggtcgcccaacgatacgcctacagaatgtatggataggctactggagcgtaacgttgccttcccctagttccgatatagcgtggtgatctaccagtgaaccctgtgtggctgcccttaaaggaaagcttgctgtcaccacaacggggtaacgtctatactcgcgatcgacctctaggttgagatcacagagcgacgcagcggcctaggcattggcaccctaggtggtagtctttccgtataactccctcaggtagaacaggcatttagccccacgccccggctgacctcaccgatgcgttcgacttttcgggtatacatgcggccgagcaccgagtgtttcttggaagtcccgactcaggtaccgtctgtagccctgaatgtactgaagccagaacatttatttgaggcaaattcctaaaaagaagtgagaacccaacgttccctccctgagcgtggccagggatagaactaaaagtctccatgagatatttccaggttcttgtaccctccatatagtattttccctgctctatggactcactccgtaattcccgccggccgctcctttgttccctcctgatactcagtccatcctgcctagccgactgcgcgaaacgaagctaaagcgtcgtgctagagcgagcttggaatcgaatcagggcataggtgagttcaatcggggaaccaccagcaccgcacttgacatccctgatttacgctgaagagttaatcaatgtgagagctggaactgctgaggtctttctgacttcataatgcctgcgctgtgacccaattgatattgtcgtcggaaagttattccgttccataccattggaactaagccagacatccgtttaattatgcggtctgagagagtactttcgctacgctctttctggttatcaggcgtacacgggaatcgtaatagattatcgtagtcaaagggacaacaaagggcacgctc"
      |> Bio.Restriction.digest(Bio.Restriction.Enzyme.asi256i())

    expected = [
      "cgagcgcttcgtaagtcggacgaaagaaaaaggtg",
      "atcaatagcatatcgtcttctgggaatccaccgtagccgatgctgtagcagtaaggtttgctacccattcgggtaaggccgctttgcaagttctttttggtacgcatgccgcgtggtaagggtgtcacagtgcacacattctcccatctaagtagttctatagaaaaacggttgggactagtaaatactgtagacaagtgacttatacaatcgtgccaggacgctgtgggtacgattcagttcg",
      "atctcttatacactcgtgcaatgtcg",
      "atcaattaagtaaaacaagagacttttagtgcatctttggg",
      "atcggtaagctgtcgtaagtacattttgcgcaatcttggtatatcccctcacgccgtccgatacgactacgcatgctgacgttagcttgttggagatggtgaaaaaaggtctgttggaaggccgtggccagtcgcacaacatcatataagattctccgtttatgttgtgtagagtcacatatattccggcggtcgcccaacgatacgcctacagaatgtatggataggctactggagcgtaacgttgccttcccctagttccgatatagcgtggtg",
      "atctaccagtgaaccctgtgtggctgcccttaaaggaaagcttgctgtcaccacaacggggtaacgtctatactcgcg",
      "atcgacctctaggttgag",
      "atcacagagcgacgcagcggcctaggcattggcaccctaggtggtagtctttccgtataactccctcaggtagaacaggcatttagccccacgccccggctgacctcaccgatgcgttcgacttttcgggtatacatgcggccgagcaccgagtgtttcttggaagtcccgactcaggtaccgtctgtagccctgaatgtactgaagccagaacatttatttgaggcaaattcctaaaaagaagtgagaacccaacgttccctccctgagcgtggccagggatagaactaaaagtctccatgagatatttccaggttcttgtaccctccatatagtattttccctgctctatggactcactccgtaattcccgccggccgctcctttgttccctcctgatactcagtccatcctgcctagccgactgcgcgaaacgaagctaaagcgtcgtgctagagcgagcttggaatcgaatcagggcataggtgagttcaatcggggaaccaccagcaccgcacttgacatccctgatttacgctgaagagttaatcaatgtgagagctggaactgctgaggtctttctgacttcataatgcctgcgctgtgacccaattgatattgtcgtcggaaagttattccgttccataccattggaactaagccagacatccgtttaattatgcggtctgagagagtactttcgctacgctctttctggttatcaggcgtacacgggaatcgtaatagattatcgtagtcaaagggacaacaaagggcacgctc"
    ]

    assert output == expected
  end

  @tag :performance
  test "large sequence with paqci" do
    output =
      "ccgacttgacagtgcgcaaagtcgtaagggtctagttaaatgtcgtcacctgcggcgatcaggatcgcaccatgtatatcgacgtattgtccgcgcgaatatcaactgatgagccttccagaagcgcatccacagatacgtccattcaggatcaccacacagtgggtccgtgtctccgtacacctgcttcacacacggtgatgatggttgctgcgtttcctagagcggtaccgatttatctgagttatgtcatgctcccaagtaagtgaaaacagtggctgttaaggtgcgggcctctatctgaaggcctgttgcgttctgcacatggacaagcccggtgcacacgccctacgattttcgtgatctgctcctcccgcccccctagcgaccggactactgtacgatcaaaaggctaatccggagattgcttgtatctgcggccgctagtgtcaacaaccgtacttcctgtccgtcgttggccgtttcagctaccccggtgataaagccagaatgggccagaccatgattagagcgtggaatttttccactaccagcgctaatatgacgcaggctcatttcgtgcacttcaaggcgtcaatacatctgatttggcaggctcgcccgtacgtgtctcaaacaatttcgctggtacctcctttccacgaagtatcatagtttgtgacgctccacctgctggtatcgcttttggtttccgtcatctggtagccaaatgcttcacctgcaccaaataatggtgggagttttggggtaaccaagcgctagatgtggcgtatgtcacaatgaggtttcacttacagtagccatagaggaaaaacttctagtagacctttcccctgttcagctcacaagggcctctttgggctcaggcctagtgcgcagttagcaggacactagcccaatgatctctaaaggggtcgcaagtggccaagttctacacatgtggggtaccagtctgttgccgtcacatatgacacttagcccttgtgactaccttctctgtgagccggtcattgagtccggccttatcgctaagaacgagctggtaatagcacctgctaagtctcattatgcttaatctggcagtgccatgttcagcaagtttaccaatatgctcatcacggagtaagctccgaatgacgcggaatgcccgtaggtcgcatcccaagtgtatttgcgagactgttaaacagtcgagcttaccaacgatggatctgacgtgaacacgtgatgagaggaacactgtaccaggagggcaacccggggagttgcatacggggaattatatcatcatgcacacaggacattcagcgtaacgtcggaccaggggagtaacgtatatggtgccatattgcggcgcacctgccttttcatcactgcgcagttccacaggctctctaattcctaggaatacacaaggccgtaaactaataactcccgcccctattagctcaagcgctgcccttttagatgcgtcgtataacctgcacgtgcagtgcgggagtagtctccatcgacacctgcacaggtat"
      |> Bio.Restriction.digest(Bio.Restriction.Enzyme.paqci())

    expected = [
      "ccgacttgacagtgcgcaaagtcgtaagggtctagttaaatgtcgtcacctgcggcg",
      "atcaggatcgcaccatgtatatcgacgtattgtccgcgcgaatatcaactgatgagccttccagaagcgcatccacagatacgtccattcaggatcaccacacagtgggtccgtgtctccgtacacctgcttca",
      "cacacggtgatgatggttgctgcgtttcctagagcggtaccgatttatctgagttatgtcatgctcccaagtaagtgaaaacagtggctgttaaggtgcgggcctctatctgaaggcctgttgcgttctgcacatggacaagcccggtgcacacgccctacgattttcgtgatctgctcctcccgcccccctagcgaccggactactgtacgatcaaaaggctaatccggagattgcttgtatctgcggccgctagtgtcaacaaccgtacttcctgtccgtcgttggccgtttcagctaccccggtgataaagccagaatgggccagaccatgattagagcgtggaatttttccactaccagcgctaatatgacgcaggctcatttcgtgcacttcaaggcgtcaatacatctgatttggcaggctcgcccgtacgtgtctcaaacaatttcgctggtacctcctttccacgaagtatcatagtttgtgacgctccacctgctggt",
      "atcgcttttggtttccgtcatctggtagccaaatgcttcacctgcacca",
      "aataatggtgggagttttggggtaaccaagcgctagatgtggcgtatgtcacaatgaggtttcacttacagtagccatagaggaaaaacttctagtagacctttcccctgttcagctcacaagggcctctttgggctcaggcctagtgcgcagttagcaggacactagcccaatgatctctaaaggggtcgcaagtggccaagttctacacatgtggggtaccagtctgttgccgtcacatatgacacttagcccttgtgactaccttctctgtgagccggtcattgagtccggccttatcgctaagaacgagctggtaatagcacctgctaag",
      "tctcattatgcttaatctggcagtgccatgttcagcaagtttaccaatatgctcatcacggagtaagctccgaatgacgcggaatgcccgtaggtcgcatcccaagtgtatttgcgagactgttaaacagtcgagcttaccaacgatggatctgacgtgaacacgtgatgagaggaacactgtaccaggagggcaacccggggagttgcatacggggaattatatcatcatgcacacaggacattcagcgtaacgtcggaccaggggagtaacgtatatggtgccatattgcggcgcacctgccttt",
      "tcatcactgcgcagttccacaggctctctaattcctaggaatacacaaggccgtaaactaataactcccgcccctattagctcaagcgctgcccttttagatgcgtcgtataacctgcacgtgcagtgcgggagtagtctccatcgacacctgcacag",
      "gtat"
    ]

    assert output == expected
  end

  @tag :performance
  test "brutally aggressive load test" do
    File.read!("test/5000_x_1000_bp_seqs.txt")
    |> String.split("\n")
    |> Enum.filter(fn line -> line != "" end)
    |> Enum.map(fn line ->
      line
      |> String.split(",")
      |> Enum.with_index()
      |> Enum.reduce([[]], fn {el, idx}, line_list ->
        case idx do
          0 -> List.insert_at(line_list, 0, el)
          _ -> [Enum.at(line_list, 0), List.insert_at(Enum.at(line_list, 1), -1, el)]
        end
      end)
    end)
    |> Enum.map(fn [sequence, expectation] ->
      output =
        sequence
        |> Bio.Restriction.digest(Bio.Restriction.Enzyme.asi256i())

      true = assert output == expectation
    end)
  end
end
