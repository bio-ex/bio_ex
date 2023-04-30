defprotocol Bio.Protocols.Convertible do
  @moduledoc """
  The `Bio.Protocols.Convertible` protocol allows us to define implementations
  of a `convert/3` function within the context that makes sense. This is part of
  the approach to translating different polymers according to the nature of
  actual biological or chemical processes.

  This may seem convoluted, but I really think it might be a cool way to do
  this. For further information, read the `Bio.Sequence.Polymer` module
  documentation.
  """
  @spec convert(struct(), module(), (String.t() -> String.t())) :: struct()
  def convert(from, to, opts)
end
