defmodule Bio.SimpleSequence do
  @moduledoc """
  Calling `use Bio.SimpleSequence` will generate a simple struct in the calling
  module, as well as the implementation for the `Enumerable` protocol.

  One downside to the current implementation is that the semantics of some of
  the Enum methods is a little wonky. The best example of this is `Enum.slide`.
  I can see this being somewhat useful, but only if it were to capably return
  the enumerable itself. However, the implementation will return a list
  regardless of your defined implementation because it uses `Enum.reduce`, and
  then further manipulates the output as lists.

  To get around this limitation, I have implemented a `slide/3` function within
  the `Bio.Sequence.Utilities` module.
  """
  defmacro __using__(_) do
    quote do
      using_module = __MODULE__
      defstruct sequence: "", length: 0, label: ""

      def new(seq, opts \\ []) when is_binary(seq) do
        [label: &String.slice(&1, 0, 0), length: &String.length(&1)]
        |> Enum.map(fn {key, default} ->
          {key, Keyword.get(opts, key) || default.(seq)}
        end)
        |> Enum.into(%{})
        |> Map.merge(%{sequence: seq})
        |> then(&struct!(__MODULE__, &1))
      end

      defimpl Enumerable, for: using_module do
        @parent using_module

        def reduce(poly, acc, fun) do
          do_reduce(to_str_list(poly.sequence), acc, fun)
        end

        defp do_reduce(_, {:halt, acc}, _fun) do
          {:halted, acc}
        end

        defp do_reduce(list, {:suspend, acc}, fun) do
          {:suspended, acc, &do_reduce(list, &1, fun)}
        end

        defp do_reduce([], {:cont, acc}, _fun) do
          {:done, acc}
        end

        defp do_reduce([h | t], {:cont, acc}, fun) do
          do_reduce(t, fun.(h, acc), fun)
        end

        defp to_str_list(obj) when is_binary(obj) do
          obj
          |> String.to_charlist()
          |> Enum.map(&<<&1>>)
        end

        defp to_str_list(%@parent{sequence: obj}) do
          obj
          |> String.to_charlist()
          |> Enum.map(&<<&1>>)
        end

        def member?(poly, element) when is_binary(element) do
          element_len = String.length(element)

          cond do
            poly.length < element_len -> {:ok, false}
            poly.length == element_len -> {:ok, poly.sequence == element}
            poly.length > element_len -> check(poly.sequence, element_len, element)
          end
        end

        defp check(<<bin::binary>>, size, element) do
          <<chunk::binary-size(size), _::binary>> = bin
          <<_::binary-size(1), rest::binary>> = bin

          cond do
            chunk == element ->
              {:ok, true}

            true ->
              cond do
                String.length(rest) >= size -> check(rest, size, element)
                true -> {:ok, false}
              end
          end
        end

        defp check(<<>>, _size, _element) do
          {:ok, false}
        end

        def count(poly) do
          {:ok, poly.length}
        end

        def slice(poly) do
          {:ok, poly.length,
           fn start, amount, _step ->
             <<_before::binary-size(start), chunk::binary-size(amount), _rest::binary>> =
               poly.sequence

             String.to_charlist(chunk)
           end}
        end
      end
    end
  end
end
