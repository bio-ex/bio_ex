defmodule Bio.Sequence.Alphabets do
  @moduledoc """
  Alphabets relevant to the sequences, coding schemes are expressed in
  essentially [BNF](https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_form).
  Values and interpretations for the scheme were accessed from
  [here](https://www.insdc.org/submitting-standards/feature-table/).
  - `Bio.Sequence.Dna`
    The DNA alphabets provided are:
    - `common` - The standard bases `ATGCatgc`
    - `with_n` - The standard alphabet, but with the ambiguous "any" character
    `Nn`
    - `iupac` - The IUPAC standard values `ACGTRYSWKMBDHVNacgtryswkmbdhvn`

  - `Bio.Sequence.Rna`
    - `common` - The standard bases `ACGUacgu`
    - `with_n` - The standard alphabet, but with the ambiguous "any" character
    `Nn`
    - `iupac` - The IUPAC standard values `ACGURYSWKMBDHVNacguryswkmbdhvn`

  - `Bio.Sequence.AminoAcid`
    - `common` - The standad 20 amino acid codes `ARNDCEQGHILKMFPSTWYVarndceqghilkmfpstwyv`
    - `iupac` - `ABCDEFGHJIKLMNPQRSTVWXYZabcdefghjiklmnpqrstvwxyz`

  # Coding Schemes
  ## Deoxyribonucleic Acid codes
  ```
  A ::= Adenine
  C ::= Cytosine
  G ::= Guanine
  T ::= Thymine

  R ::= A | G
  Y ::= C | T
  S ::= G | C
  W ::= A | T
  K ::= G | T
  M ::= A | C

  B ::= S | T (¬A)
  D ::= R | T (¬C)
  H ::= M | T (¬G)
  V ::= M | G (¬T)
  N ::= ANY
  ```

  ## Ribonucleic Acid codes
  ```
  A ::= Adenine
  C ::= Cytosine
  G ::= Guanine
  U ::= Uracil

  R ::= A | G
  Y ::= C | U
  S ::= G | C
  W ::= A | U
  K ::= G | U
  M ::= A | C

  B ::= S | U (¬A)
  D ::= R | U (¬C)
  H ::= M | U (¬G)
  V ::= M | G (¬U)
  N ::= ANY
  ```

  ## Amino Acid codes
  ```
  A ::= Alanine
  C ::= Cysteine
  D ::= Aspartic Acid
  E ::= Glutamic Acid
  F ::= Phenylalanine
  G ::= Glycine
  H ::= Histidine
  I ::= Isoleucine
  K ::= Lysine
  L ::= Leucine
  M ::= Methionine
  N ::= Asparagine
  P ::= Proline
  Q ::= Glutamine
  R ::= Arginine
  S ::= Serine
  T ::= Threonine
  V ::= Valine
  W ::= Tryptophan
  Y ::= Tyrosine

  B ::= D | N
  Z ::= Q | E
  J ::= I | L
  X ::=  ANY
  ```
  """
  defmodule Dna do
    @moduledoc false
    @common "ATGCatgc"
    @with_n "ACGTNacgtn"
    @iupac "ACGTRYSWKMBDHVNacgtryswkmbdhvn"

    def common, do: @common
    def with_n, do: @with_n
    def iupac, do: @iupac
  end

  defmodule Rna do
    @moduledoc false
    @common "ACGUacgu"
    @with_n "ACGUNacgun"
    @iupac "ACGURYSWKMBDHVNZacguryswkmbdhvnz"

    def common, do: @common
    def with_n, do: @with_n
    def iupac, do: @iupac
  end

  defmodule AminoAcid do
    @moduledoc false
    @common "ARNDCEQGHILKMFPSTWYVarndceqghilkmfpstwyv"
    @iupac "ABCDEFGHJIKLMNPQRSTVWXYZabcdefghJiklmnpqrstvwxyz"

    def common, do: @common
    def iupac, do: @iupac
  end
end
