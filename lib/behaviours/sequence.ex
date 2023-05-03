defmodule Bio.Behaviours.Sequence do
  @callback new(base :: term(), opts :: keyword()) :: struct :: term()
  @callback converter() :: converter :: module()
  @callback fasta_line(given :: struct()) :: line :: String.t()
end
