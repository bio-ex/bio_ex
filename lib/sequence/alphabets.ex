defmodule Bio.Sequence.Alphabets do
  defmodule Dna do
    @common "ATGCatgc"
    @with_n "ACGTNacgtn"
    @iupac "ACGTRYSWKMBDHVNZacgtryswkmbdhvnz"

    def common, do: @common
    def with_n, do: @with_n
    def iupac, do: @iupac
  end

  defmodule Rna do
    @common "ACGUacgu"
    @with_n "ACGUNacgun"
    @iupac "ACGURYSWKMBDHVNZacguryswkmbdhvnz"

    def common, do: @common
    def with_n, do: @with_n
    def iupac, do: @iupac
  end

  defmodule AminoAcid do
    @common "ARNDCEQGHILKMFPSTWYVarndceqghilkmfpstwyv"
    @iupac "ABCDEFGHIKLMNPQRSTVWXYZabcdefghiklmnpqrstvwxyz"

    def common, do: @common
    def iupac, do: @iupac
  end
end
