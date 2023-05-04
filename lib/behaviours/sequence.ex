defmodule Bio.Behaviours.Sequence do
  @moduledoc """
  How a "sequence" ought to comport itself.

  The `Bio.Behaviours.Sequence` behaviour is used to define the expected
  functions exposed by "sequences". In general, sequences are basically a
  replacement for the enumerable qualities of strings in some other languages.

  Because that requires defining a protocol, and that requires a struct, it
  makes a lot of sense to have an easy to use initializer. Thus, the `new/2`
  method. The `opts` defined will depend on the type of sequence you're
  creating, and so the typing is left rather general here.

  Because most sequences can be transcoded into other sequences (e.g. DNA ->
  Amino Acid), we also want to define an accessor for the module that handles
  that conversion. This is why the `converter/0` function exists. This works
  together with the `Bio.Behaviours.Converter`, `Bio.Protocols.Convertible`, and
  `Bio.Sequence.Polymer` modules to create a robust conversion mechanic that can
  be hooked into by user defined types. For further reading on that, look at the
  `Bio.Sequence.Polymer` module docs.

  The final callback, `fasta_line/1`, exists because this is a bioinformatics
  library. Sequences are pretty much always going to be written out to a fasta
  file, or some similar context. Defining this as a callback means that we can
  make it easier for your types to be given directly to the `Bio.IO.Fasta`
  module for writing. Eventually, I'd probably like to come up with a more
  general `dump` style mechanic. But this'll do for pre-alpha.
  """

  @doc """
  Builds a new struct for the implementing type
  """
  @callback new(base :: term(), opts :: keyword()) :: struct :: term()

  @doc """
  Returns the module which implements `Bio.Protocols.Convertible`

  This returns the module, which is then used from within
  `Bio.Sequence.Polymer.convert/3` to acquire the correct conversion function
  for a given type.
  """
  @callback converter() :: converter :: module()

  @doc """
  Given a struct, returns the String.t() line for a FASTA file

  This will be called from within `Bio.IO.Fasta.write/3`
  """
  @callback fasta_line(given :: struct()) :: line :: String.t()
end
