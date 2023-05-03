defmodule Bio.Sequence.Polymer do
  @moduledoc """
  Deals with conversions between polymers that define a
  `Bio.Protocols.Convertible` interface.

  This module wraps the logic of accessing a given polymer's defined
  conversions. The primary idea is that I wanted to expose the ability to
  provide a non-default conversion without losing the semantics of a simple
  default when it's present.

  To put that in more concrete terms, I wanted this to be viable:

      iex>dna = DnaStrand.new("ttagccgt", label: "a label")
      ...>Polymer.convert(dna, RnaStrand)
      {:ok, %RnaStrand{sequence: "uuagccgu", length: 8, label: "a label"}}

  But, and this is the important part, other conversions are not well defined by
  defaults. For example:

      iex>amino = AminoAcid.new("maktg")
      ...>Polymer.convert(amino, DnaStrand)
      {:error, :undef_conversion}

  The `:undef_conversion` indicates that there is no viable default
  implementation of the conversion between these polymers. It _does not_
  indicate that there is none. Obviously one can convert from an amino acid to
  _some_ DNA strand. However, because this would imply making a selection from
  the available codons, that is left to the logic of whatever application is
  doing so.

  The way that you would do that is straight forward, you would define a
  conversion module and pass it to the `convert/3` function as the keyword
  argument `:conversion`. For example, if we wanted to defined a mapping that
  converted into a compressed DNA representation, we could do:

      iex>defmodule CompressedAminoConversion do
      ...>  def to(DnaStrand), do: {:ok, &compressed/1}
      ...>  def to(_), do: {:error, :undef_conversion}
      ...>  def compressed(amino) do
      ...>    case amino do
      ...>      "a" -> "gcn"
      ...>      "r" -> "cgn"
      ...>      "n" -> "aay"
      ...>      "d" -> "gay"
      ...>      "c" -> "tgy"
      ...>      "e" -> "gar"
      ...>      "q" -> "car"
      ...>      "g" -> "ggn"
      ...>      "h" -> "cay"
      ...>      "i" -> "ath"
      ...>      "l" -> "ctn"
      ...>      "k" -> "aar"
      ...>      "m" -> "atg"
      ...>      "f" -> "tty"
      ...>      "p" -> "ccn"
      ...>      "s" -> "tcn"
      ...>      "t" -> "acn"
      ...>      "w" -> "tgg"
      ...>      "y" -> "tay"
      ...>      "v" -> "gtn"
      ...>    end
      ...>  end
      ...>end
      ...>amino = AminoAcid.new("maktg", label: "polypeptide-∂")
      ...>Polymer.convert(amino, DnaStrand, conversion: CompressedAminoConversion)
      {:ok, %DnaStrand{sequence: "atggcnaaracnggn", length: 15, label: "polypeptide-∂"}}

  This is made possible because of the simple implementation of the
  `Bio.Protocols.Convertible` interface for the `Bio.Sequence.AminoAcid`. If
  you want to define your own convertible polymer types, you can. It requires
  defining the module and the implementation of `convert/1`. You can read the
  `Bio.Sequence.AminoAcid` source for more clarity on the details.

  This package attempts to define reasonable defaults for all the occasions
  which it can. This includes converting DNA into RNA, and RNA to DNA. The
  conversions from DNA/RNA to Amino Acid are done using standard codon tables.

  The Conversion module idea is provided as an escape hatch for more particular
  applications which may require bespoke logic. An example would be converting
  Amino Acids into a DNA sequence, as above. There are likely more use cases
  than I could possibly compile on my own, so I tried to come up with a way to
  alleviate that pressure.
  """
  alias Bio.Protocols.Convertible

  @doc """
  Apply a conversion to a given datum.

  The `convert/3` function is at the core of using the `Bio.Sequence.Polymer`
  module. By passing the function a struct and the module you wish to convert
  to, you are hooking into the underlying implementation of the
  `Bio.Behaviours.Converter` for that module. This means that both the struct
  you given _as well as the module_ must have this implemented.

  # Examples
  Given a struct and module with a known conversion:

      iex>dna = DnaStrand.new("ttagccgt", label: "a label")
      ...>Polymer.convert(dna, RnaStrand)
      {:ok, %RnaStrand{sequence: "uuagccgu", length: 8, label: "a label"}}

  Given a struct and module with unknown conversions:

      iex>amino = AminoAcid.new("maktg")
      ...>Polymer.convert(amino, DnaStrand)
      {:error, :undef_conversion}

  Given a struct that doesn't implement `Bio.Behaviours.Converter`:

      iex>amino = Bio.IO.QualityScore.new("maktg", encoding: :phred_33)
      ...>Polymer.convert(amino, DnaStrand)
      {:error, :no_converter}
  """
  @spec convert(struct(), module(), keyword()) :: {:ok, struct()} | {:error, :undef_conversion}
  def convert(%_{} = data, module, opts \\ []) do
    case Keyword.get(opts, :conversion) do
      nil ->
        conversion_module = apply(data.__struct__, :converter, [])

        case apply(conversion_module, :to, [module]) do
          {:ok, elementwise_converter} ->
            {:ok, Convertible.convert(data, module, elementwise_converter)}

          otherwise ->
            otherwise
        end

      conversion_module ->
        case apply(conversion_module, :to, [module]) do
          {:ok, elementwise_converter} ->
            {:ok, Convertible.convert(data, module, elementwise_converter)}

          otherwise ->
            otherwise
        end
    end
  rescue
    UndefinedFunctionError -> {:error, :no_converter}
  end
end
