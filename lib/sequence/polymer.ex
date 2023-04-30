defmodule Bio.Sequence.Polymer do
  @moduledoc """
  Deals with conversions between polymers that define a
  `Bio.Protocols.Convertible` interface.

  This module wraps the logic of accessing a given polymer's defined
  conversions. The primary idea is that I wanted to expose the ability to
  provide a non-default conversion without losing the semantics of a simple
  default when it's present.

  To put that in more concrete terms, I wanted this to be viable:

    iex>dna = Bio.Sequence.DnaStrand.new("ttagccgt", label: "Test sequence")
    ...>Polymer.convert(dna, Bio.Sequence.RnaStrand)
    ...>%RnaStrand{sequence: "uuagccgu"}
  """
  alias Bio.Protocols.Convertible

  def convert(%_{} = data, module, opts \\ []) do
    case Keyword.get(opts, :conversion) do
      nil ->
        conversion_module = Module.concat(data.__struct__, DefaultConversions)

        case apply(conversion_module, :to, [module]) do
          {:ok, converter} ->
            Convertible.convert(data, module, converter)

          {:error, :undef_converter} ->
            {:error, "Conversion of #{data.__struct__} to #{module} is not defined. You
            must create a module defining the conversion to be used and pass to
            convert."}
        end

      conversion_module ->
        Convertible.convert(data, module, apply(conversion_module, :to, [module]))
    end
  end
end
