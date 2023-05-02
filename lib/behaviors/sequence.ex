defmodule Bio.Behaviors.Sequence do
  @callback new(base :: term(), opts :: keyword()) :: struct :: term()
  @callback converter() :: converter :: module()
end
