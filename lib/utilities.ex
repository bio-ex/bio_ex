defmodule Utilities do
  def empty?(elem) do
    case elem do
      [] -> true
      %{} -> true
      {} -> true
      "" -> true
      nil -> true
      _ -> false
    end
  end

  def not_empty?(elem) do
    not empty?(elem)
  end
end
