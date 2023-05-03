defmodule Bio.Behaviours.Sequence do
  @moduledoc """
  Sequence stuff
  """

  @doc """
  builds a new struct
  """
  @callback new(base :: term(), opts :: keyword()) :: struct :: term()
  @doc """
  returns a module
  """
  @callback converter() :: converter :: module()
  @doc """
  defines how to write to a fasta file
  """
  @callback fasta_line(given :: struct()) :: line :: String.t()
end
