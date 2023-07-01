defmodule Bio.Rebase.Emboss do
  @moduledoc false

  @keep_elements [:blunt?, :cut_1, :cut_2, :cut_3, :cut_4, :name, :pattern, :suppliers]
  def parse(patterns_file, information_file, suppliers_file) do
    [
      parse_patterns(patterns_file),
      parse_information(information_file),
      parse_suppliers(suppliers_file)
    ]
    |> convolve()
  end

  def date_term() do
    date = Date.utc_today()

    month_part =
      cond do
        date.month >= 10 -> date.month
        true -> "0#{date.month}"
      end

    "#{String.slice("#{date.year}", 3, 99)}#{month_part}"
  end

  defp convolve(data) do
    [patterns, info, suppliers] = data

    # Patterns and info should have the same len, suppliers is just a map that
    # we can use to replace the weird keys with actual values
    patterns
    |> Enum.map(fn pat_map ->
      Enum.find(info, &(Map.get(&1, :enzyme_name) == Map.get(pat_map, :name)))
      |> Map.merge(pat_map)
    end)
    |> Enum.map(fn full_map ->
      cond do
        # This data is confusing, and possibly wrong.
        full_map.name in ["HpyUM037X"] ->
          nil

        true ->
          full_map
          |> Enum.reduce(%{}, fn {key, value}, acc ->
            cond do
              key in @keep_elements -> Map.put(acc, key, value)
              true -> acc
            end
          end)
      end
    end)
    |> Enum.filter(&Function.identity/1)
  end

  # Format:
  # Line 1: Name of Enzyme
  # Line 2: Organism
  # Line 3: Isoschizomers
  # Line 4: Methylation
  # Line 5: Source
  # Line 6: Suppliers
  # Line 7: Number of following references
  # Lines 8..n: References
  # // (end of entry marker)
  defp parse_information(file) do
    File.read!(file)
    |> split_newline()
    |> Enum.filter(&not_comment?/1)
    |> Enum.join("\n")
    |> String.split("//")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&split_newline/1)
    |> Enum.filter(&not_empty?/1)
    |> Enum.map(&references_collection/1)
  end

  defp references_collection(block) do
    Enum.with_index(block, 1)
    |> Enum.reduce(%{}, fn {line, idx}, acc ->
      case idx do
        1 -> Map.put(acc, :enzyme_name, line)
        2 -> Map.put(acc, :organism_name, line)
        3 -> Map.put(acc, :isoschizomers, line)
        4 -> Map.put(acc, :methylation, line)
        5 -> Map.put(acc, :source, line)
        6 -> Map.put(acc, :suppliers, String.graphemes(line))
        7 -> Map.put(acc, :number_of_references, line)
        _ -> Map.put(acc, :references, List.insert_at(Map.get(acc, :references, []), -1, line))
      end
    end)
  end

  # Format:
  # name<ws>pattern<ws>len<ws>ncuts<ws>blunt<ws>c1<ws>c2<ws>c3<ws>c4
  #
  # Where:
  # name = name of enzyme
  # pattern = recognition site
  # len = length of pattern
  # ncuts = number of cuts made by enzyme
  #         Zero represents unknown
  # blunt = true if blunt end cut, false if sticky
  # c1 = First 5' cut
  # c2 = First 3' cut
  # c3 = Second 5' cut
  # c4 = Second 3' cut
  defp parse_patterns(file) do
    File.read!(file)
    |> split_newline()
    |> Enum.filter(&not_comment?/1)
    |> Enum.filter(&not_empty?/1)
    |> Enum.map(&information_collection/1)
  end

  defp information_collection(line) do
    line
    |> String.split("\t")
    |> Enum.with_index(1)
    |> Enum.reduce(%{}, fn {el, idx}, acc ->
      case idx do
        1 -> Map.put(acc, :name, el)
        2 -> Map.put(acc, :pattern, String.downcase(el))
        3 -> Map.put(acc, :length, String.to_integer(el))
        4 -> Map.put(acc, :number_cuts, String.to_integer(el))
        5 -> Map.put(acc, :blunt?, cast(el))
        6 -> Map.put(acc, :cut_1, String.to_integer(el))
        7 -> Map.put(acc, :cut_2, String.to_integer(el))
        8 -> Map.put(acc, :cut_3, String.to_integer(el))
        9 -> Map.put(acc, :cut_4, String.to_integer(el))
      end
    end)
  end

  defp cast(str) do
    cond do
      str == "0" -> false
      str == "false" -> false
      str == "False" -> false
      str == "no" -> false
      str == "No" -> false
      str == "1" -> true
      str == "true" -> true
      str == "True" -> true
      str == "yes" -> true
      str == "Yes" -> true
    end
  end

  # Format:
  # Code of Supplier<ws>Supplier name
  defp parse_suppliers(file) do
    File.read!(file)
    |> split_newline()
    |> Enum.filter(&not_comment?/1)
    |> Enum.filter(&not_empty?/1)
    |> Enum.map(fn str -> String.split_at(str, 1) end)
    |> Enum.reduce(%{}, fn {code, supplier}, acc ->
      Map.put(acc, code, String.trim(supplier))
    end)
  end

  defp not_comment?(str) do
    !String.starts_with?(str, "#")
  end

  defp split_newline(block) do
    String.split(block, "\n")
  end

  defp not_empty?(thing) when is_binary(thing) do
    cond do
      thing == "" -> false
      true -> true
    end
  end

  defp not_empty?(thing) when is_list(thing) do
    cond do
      thing == [] -> false
      Enum.all?(thing, fn el -> el == "" end) -> false
      true -> true
    end
  end
end
