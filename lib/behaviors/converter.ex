defmodule Bio.Behaviors.Converter do
  @callback to(thing :: module()) :: {:ok, (term() -> term())} | {:error, :undef_conversion}

  defmacro __using__(opts) do
    block = Keyword.get(opts, :do, nil)

    quote do
      @behaviour Bio.Behaviors.Converter
      unquote(block)

      def to(module), do: {:error, :undef_conversion}
    end
  end
end
