defmodule Bio.XML do
  def read(filename) do
    {doc, _rest} = :xmerl_scan.file(filename)
    doc
  end

  def get(doc, path) do
    :xmerl_xpath.string(path, doc)
  end

  def str(doc, path) do
    {_, _, value} = :xmerl_xpath.string('string(#{path})', doc)
    List.to_string(value)
  end

  def root_str(doc) do
    str(doc, '/*')
  end

  def collect(doc, path) do
    doc
    |> get(path)
    |> Stream.map(&root_str/1)
    |> Enum.into([])
  end

  def collect(doc, path, transform) do
    doc
    |> get(path)
    |> Stream.map(fn el -> transform.(el) end)
    |> Enum.into([])
  end
end
