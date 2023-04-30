defmodule Bio.Sequence.Alphabets do
  @moduledoc false
  defmodule Dna do
    @moduledoc false
    @common "ATGCatgc"
    @with_n "ACGTNacgtn"
    @iupac "ACGTRYSWKMBDHVNZacgtryswkmbdhvnz"

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
    @iupac "ABCDEFGHIKLMNPQRSTVWXYZabcdefghiklmnpqrstvwxyz"

    def common, do: @common
    def iupac, do: @iupac
  end
end
