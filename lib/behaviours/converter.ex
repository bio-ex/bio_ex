defmodule Bio.Behaviours.Converter do
  @moduledoc """
  Defines behavior for modules to act as a converter between sequences.

  The core of this module is to provide the default `to/1` function that returns
  the error tuple for undefined conversions. This alleviates the need of the
  module needing to implement, and eliminates the possibility of the function
  `to/1` raising due to no matching clauses.

  To achieve this, the module uses a block for defining the user-side `to/1`
  calls. The module is used as such:

  ``` elixir
  defmodule SomeConversion do
    use Bio.Behaviours.Converter do
      def to(SomeModule), do: &your_elementwise_converter/1

      defp your_elementwise_converter(element) do
        # conversion logic
      end
    end
  end
  ```

  This defines the elemnt-wise converter that will be used by
  `Bio.Sequence.Polymer.convert/3`. The function will be applied to every
  element of the base type that uses this conversion module. So if we wanted to
  use this converter for `SomeSequence`:

  ``` elixir
  defmodule SomeSequence do
    @behaviour Bio.Behaviours.Sequence

    @impl Bio.Behaviours.Sequence
    def converter, do: SomeConversion

    # implementation of other callbacks
  end
  ```

  Now you can simply call:

  ``` elixir
  SomeSequence.new("some data")
  |> Bio.Polymer.convert(SomeModule)
  ```
  """

  @doc """
  Defines the converter's element-wise conversion function

  This is called within the `Bio.Polymer.convert/3` function to acquire the
  element-wise conversion function for sequence to another.
  """
  @callback to(thing :: module()) :: {:ok, (term() -> term())} | {:error, :undef_conversion}

  defmacro __using__(opts) do
    block = Keyword.get(opts, :do, nil)

    quote do
      @behaviour Bio.Behaviours.Converter
      unquote(block)

      def to(module), do: {:error, :undef_conversion}
    end
  end
end
