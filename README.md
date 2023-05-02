# Bio Ex

Bioinformatics tools for Elixir.

## Modules

### Restriction

An Elixir implementation for restriction enzyme data based on the REBASE
database.

### Sequence

Sequence manipulations, validations and general IUPAC data.

## Tasks

### bio.restriction.\*

#### update

Download and build the restriction enzymes using the REBASE Emboss files.

Parameters:

- `--email/-p`: email to use as password for the FTP of REBASE files
- `--cache-dir/-d`: directory to look for and store the emboss files

#### download

Download the REBASE emboss files. If the files exist in `--cache-dir`, then the
download will be skipped.

Parameters:

- `--email/-p`: email to use as password for the FTP of REBASE files
- `--cache-dir/-d`: directory to look for and store the emboss files

#### build

Generate `Bio.Restriction.Enzyme` module content from the REBASE emboss files
using the `Bio.Rebase.Emboss.parse/1` function.

Parameters:

- `--cache-dir/-d`: directory to look the emboss files

### bio.random

#### dna

Generate a number of random DNA sequences. See [Erlang](https://www.erlang.org/doc/man/random.html) docs to understand the
available options for algorithms.

Parameters:

- `--seed/-s`: seed value for the RNG (defaults to `:random` defaults)
- `--algorithm/-a`: algorithm value for the RNG (defaults to `:exsss`)
- `--outfile/-f`: path for output to be loaded (required)
- `--seq-size/-z`: size for the generated sequence in nucleotides (required)
- `--seq-count/-c`: number of sequences to generate (required)

## Installation

[Available in Hex](https://hex.pm/packages/bio_ex).

The package can be installed by adding `bio_ex` to your list of dependencies
in `mix.exs`:

```elixir
def deps do
  [
    {:bio_ex, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/restrict_ex](https://hexdocs.pm/restrict_ex).

## Credit

Big shout out to the [BioPython](https://github.com/biopython) team. I used many data sources according to
their implementations, and referenced many details of the file types for parsing
from their implementations as well. While I wouldn't consider this a port, it is
definitely spiritually related to that project!
