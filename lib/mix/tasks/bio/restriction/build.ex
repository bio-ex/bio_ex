defmodule Mix.Tasks.Bio.Restriction.Build do
  @moduledoc """
  Module for building out the actual data structure that will be generated in
  code.

  Each enzyme will be defined as a struct under the `Bio.Restriction.Enzyme`
  namespace. This struct will be populated with the minimal data needed for the
  use in digestion and sequence validations.

  Further additions to the data can be requested by opening an issue.

  The current data preserved are:

  blunt?: boolean
  cut_1: number
  cut_2: number
  cut_3: number
  cut_4: number
  name: string
  pattern: string
  suppliers: [string...]


  The value of `suppliers` is a string list of the Supplier Codes. These are
  related to company names using the emboss_s file, and can be related with the
  `Bio.Restriction.Suppliers` module.
  """

  @shortdoc "Task for populating RE data"
  use Mix.Task
  alias Bio.Ansio
  alias Bio.Rebase.Emboss

  @options [cache_dir: :string]
  @aliases [d: :cache_dir]

  def run(inputs) do
    {opts, _, _} = OptionParser.parse(inputs, aliases: @aliases, strict: @options)
    Ansio.info("Building restriction data")

    base_dir =
      cond do
        opts[:cache_dir] == nil -> :filename.basedir(:user_cache, "RestrictionEx")
        true -> opts[:cache_dir]
      end

    term = Emboss.date_term()

    Emboss.parse(
      "#{base_dir}/downloads_emboss_e.#{term}",
      "#{base_dir}/downloads_emboss_r.#{term}",
      "#{base_dir}/downloads_emboss_s.#{term}"
    )
    |> write_module
  end

  defp write_module(%{enzymes: enzymes, suppliers: %{} = suppliers}) do
    Ansio.info("Writing module...")

    File.write(
      "lib/restriction/enzyme.ex",
      ~s"""
      # DO NOT MODIFY THIS FILE DIRECTLY
      # This module is generated using `mix bio.restriction.build`
      # Or with `mix bio.restriction.update`
      # Data herein is derived from the REBASE database monthly data files:
      # http://rebase.neb.com/rebase/rebase.files.html

      defmodule Bio.Restriction.Enzyme do
      @moduledoc \"\"\"
      This module houses all of the functions for accessing a struct
      of restriction enzyme data, the `%Bio.Restriction.Enzyme`.

      All functions are the name of the enzyme in lowercase, where any `-`
      characters have been made `_`. By example, "BsmBI" would be `bsmbi` or
      "CviKI-1" would become `cviki_1`.
      \"\"\"

      @suppliers %#{stringify(suppliers)}

      def get_supplier(code) when is_binary(code) do
        code
        |> String.upcase()
        |> String.to_existing_atom()
        |> get_supplier()
      end

      def get_supplier(code) when is_atom(code) do
        @suppliers
        |> Map.get(code)
      end

      @doc \"\"\"
      Get an enzyme struct by name, where name is either a binary or atom and
      case insensitive.

      # Examples
          iex>Bio.Restriction.Enzyme.get(:CviRI)
          %Bio.Restriction.Enzyme{
              blunt?: true,
              cut_1: 2,
              cut_2: 2,
              cut_3: 0,
              cut_4: 0,
              name: "CviRI",
              pattern: "tgca"
            }

          iex>Bio.Restriction.Enzyme.get("CviRI")
          %Bio.Restriction.Enzyme{
              blunt?: true,
              cut_1: 2,
              cut_2: 2,
              cut_3: 0,
              cut_4: 0,
              name: "CviRI",
              pattern: "tgca"
            }
      \"\"\"
      def get(name) when is_atom(name) do
        name
        |> Atom.to_string()
        |> get_struct()
      end

      def get(name) when is_binary(name) do
        get_struct(name)
      end

      defp get_struct(name) do
        func_name = name
        |> String.downcase()
        |> String.replace("-", "_")

        try do
          apply(__MODULE__, String.to_atom(func_name), [])
        rescue
          _ in UndefinedFunctionError -> raise "Unknown restriction enzyme \#\{func_name\}"
        end
      end

      @doc \"\"\"
      The primary struct for interacting with restriction enzymes
      \"\"\"
      defstruct #{to_source(Enum.at(enzymes, 0))}
      #{enzymes |> Enum.map(fn enzyme_map -> ~s"""
        @doc false
        def #{Map.get(enzyme_map, :name) |> String.downcase() |> String.replace("-", "_")} do
          %Bio.Restriction.Enzyme#{stringify(enzyme_map)}
        end
        """ end)}
      end
      """
    )

    Mix.Task.run("format")
    Ansio.success("Module written, formatted, and ready for release.")
  end

  def to_source(enzyme_map) do
    output =
      enzyme_map
      |> Enum.reduce("", fn {key, value}, final_str ->
        final_str <> "#{key}: #{sourcify(value)},"
      end)

    String.slice(output, 0, String.length(output) - 1)
  end

  # create a reasonable string representation of a map
  def stringify(obj) when is_map(obj) do
    final =
      obj
      |> Enum.reduce("{", fn {key, value}, str ->
        str <> "#{key}: #{stringify(value)},"
      end)

    String.replace_suffix(final, ",", "") <> "}"
  end

  def stringify(obj) when is_binary(obj) do
    "\"#{obj}\""
  end

  def stringify(obj) when is_list(obj) do
    final =
      Enum.reduce(obj, "[", fn el, acc ->
        acc <> "#{stringify(el)},"
      end)

    final <> "]"
  end

  def stringify(obj) when is_boolean(obj) do
    "#{obj}"
  end

  def stringify(obj) when is_number(obj) do
    "#{obj}"
  end

  def stringify(obj) when is_atom(obj) do
    ":#{obj}"
  end

  # sourcify to default struct values
  def sourcify(value) when is_binary(value) do
    "\"\""
  end

  def sourcify(value) when is_list(value) do
    "[]"
  end

  def sourcify(value) when is_boolean(value) do
    "nil"
  end

  def sourcify(value) when is_number(value) do
    "0"
  end
end
