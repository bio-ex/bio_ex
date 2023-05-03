defmodule Bio.MixProject do
  use Mix.Project

  @version "0.2.0"
  @source_url "https://github.com/pcapel/bio_ex"

  def project do
    [
      app: :bio_ex,
      description: describe(),
      version: @version,
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "bio_elixir",
      package: package(),
      aliases: aliases(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :ftp, :xmerl]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:benchee, "~> 1.0", only: :dev}
    ]
  end

  defp package() do
    [
      licenses: ["BSD-3-Clause"],
      links: %{"GitHub" => "https://github.com/pcapel/bio_ex"}
    ]
  end

  defp describe() do
    "A bioinformatics project for Elixir."
  end

  defp aliases do
    []
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]

  defp elixirc_paths(_), do: ["lib"]

  defp docs do
    [
      source_ref: "v#{@version}",
      source_url: @source_url,
      extras: extras(),
      extra_section: "GUIDES",
      groups_for_extras: groups_for_extras(),
      groups_for_functions: [
        group_for_function("none")
      ],
      groups_for_modules: [
        IO: [
          Bio.IO.Fasta,
          Bio.IO.FastQ,
          Bio.IO.SnapGene
        ],
        "General Polymers": [
          Bio.SimpleSequence,
          Bio.Sequence.Polymer,
          Bio.Sequence,
          Bio.Sequence.Alphabets,
          Bio.Sequence.MonomerName
        ],
        DNA: [
          Bio.Sequence.Dna,
          Bio.Sequence.Dna.Conversions,
          Bio.Sequence.DnaStrand,
          Bio.Sequence.DnaDoubleStrand
        ],
        RNA: [
          Bio.Sequence.Rna,
          Bio.Sequence.Rna.Conversions,
          Bio.Sequence.RnaStrand,
          Bio.Sequence.RnaDoubleStrand
        ],
        "Amino Acid": [
          Bio.Sequence.AminoAcid
        ],
        Restriction: [
          Bio.Restriction,
          Bio.Restriction.Enzyme
        ],
        Behaviours: [
          Bio.Behaviors.Sequence,
          Bio.Behaviors.Converter
        ],
        Utilities: [
          Bio.Enum,
          Bio.Protocols.Convertible,
          Bio.Sequence.Mapping
        ]
      ]
    ]
  end

  def extras() do
    [
      "guides/howtos/use_xml_and_xpath.md"
    ]
  end

  defp group_for_function(group), do: {String.to_atom(group), &(&1[:group] == group)}

  defp groups_for_extras do
    [
      "How-To's": ~r/guides\/howtos\/.?/,
      Cheatsheets: ~r/cheatsheets\/.?/
    ]
  end
end
