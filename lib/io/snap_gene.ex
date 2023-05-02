defmodule Bio.IO.SnapGene do
  @dna 0x00
  @primers 0x05
  @notes 0x06
  @cookie 0x09
  @features 0x0A

  @doc ~S"""
  Read a SnapGene file

  The file is read into a map with the following fields:
      %{
          sequence: String.t(),
          circular?: Boolean,
          valid?: Boolean,
          length: Integer,
          features: Tuple{XML},
        }

  The `circular?` and `dna` fields are parsed from the DNA packet. The `dna`
  field is a lowercase binary of the sequence, whose length is determined and
  stored in the `length` field.

  Validity is determined by parsing the SnapGene cookie to ensure that it
  contains the requisite "SnapGene" string.

  # TODO: link to guide
  Features require a bit more explanation, since they are stored in XML. Parsing
  them into a map is certainly a possibility, but it seemed like doing so would
  reduce the ability of a developer to leverage what I am hoping is a lower
  level library than some.

  In the interest of leaving the end user with as much power as possible, this
  method does not attempt to parse the XML stored within the file. Instead, the
  XML is returned to you in the form generated by `:xmerl_scan.string/1`. In
  doing it this way you have access to the entire space of data stored within
  the file, not just a subset that is parsed. This also means that in order to
  query the data, you need to be comfortable composing XPaths. As an example, if
  you have a terminator feature as the first feature and you want to get the
  segment range:

  # Example
      iex>{:ok, sample} = SnapGene.read("test/io/snap_gene/sample-e.dna")
      ...>:xmerl_xpath.string('string(/*/Feature[1]/Segment/@range)', sample.features)
      {:xmlObj, :string, '400-750'}

  As another note, this will also require some familiarity with the file type,
  for example whether or not a range is exclusive or inclusive on either end.
  Attempting to access a node that doesn't exist will return an empty array.

  # Example
      iex>{:ok, sample} = SnapGene.read("test/io/snap_gene/sample-e.dna")
      ...>:xmerl_xpath.string('string(/*/Feature[1]/Unknown/Path/@range)', sample.features)
      {:xmlObj, :string, []}

  The semantics of this are admittedly odd. But there's not much to be done
  about that.

  The object returned from `:xmerl_xpath.string/[2,3,4]` is a tuple, so
  `Enumerable` isn't implemented for it. You're best off sticking to XPath to
  get the required elements. The counts of things are simple enough to retrieve
  in this way though. For example, if I wanted to know how many Feature Segments
  there were:

      iex>{:ok, sample} = SnapGene.read("test/io/snap_gene/sample-e.dna")
      ...>:xmerl_xpath.string('count(/*/Feature/Segment)', sample.features)
      {:xmlObj, :number, 2}

  Now it's a simple matter to map over the desired queries to build up some data
  from the XML:

      iex>{:ok, sample} = SnapGene.read("test/io/snap_gene/sample-e.dna")
      ...>Enum.map(1..2, fn i -> :xmerl_xpath.string('string(/*/Feature[#{i}]/Segment/@range)', sample.features) end)
      [{:xmlObj, :string, '400-750'},{:xmlObj, :string, '161-241'}]

  For further examples of queries, and an explanation of the mapping of concepts
  between the XML and what is parsed from BioPython, see the `SnapGene Features`
  guide.
  """
  def read(filename) do
    case File.read(filename) do
      {:ok, content} -> {:ok, parse(content, %{})}
      not_ok -> not_ok
    end
  end

  defp parse(<<>>, output), do: output

  # A SnapGene file is made of packets, each packet being a TLV-like
  # structure comprising:
  #   - 1 single byte indicating the packet's type;
  #   - 1 big-endian long integer (4 bytes) indicating the length of the
  #     packet's data;
  #   - the actual data.
  defp parse(data, output) do
    <<packet_type::size(8), content::binary>> = data
    <<packet_length::size(32), content::binary>> = content
    <<packet::binary-size(packet_length), content::binary>> = content

    case packet_type do
      @dna -> parse(content, Map.merge(output, parse_dna(packet)))
      @primers -> parse(content, Map.merge(output, parse_primers(packet)))
      @notes -> parse(content, Map.merge(output, parse_notes(packet)))
      @cookie -> parse(content, Map.merge(output, parse_cookie(packet)))
      @features -> parse(content, Map.merge(output, parse_features(packet)))
      _ -> parse(content, output)
    end
  end

  defp parse_dna(data) do
    <<circular::size(8), rest::binary>> = data
    circular = Bitwise.band(circular, 0x01) == 1
    %{dna: String.downcase(rest), length: String.length(rest), circular?: circular}
  end

  defp parse_notes(data), do: %{notes: xml(data)}
  defp parse_features(data), do: %{features: xml(data)}
  defp parse_primers(data), do: %{primers: xml(data)}

  defp parse_cookie(<<check::binary-size(8), _::binary>>) do
    %{valid?: check == "SnapGene"}
  end

  # When reading the XML data, UTF-8 is implicitly used in the test files.
  # Fortunately, at least one of them had multi-code point characters which
  # really didn't want to play nicely with erlang's underlying
  # xmerl_scan.string. I figured out that you can enforce the latin1 encoding
  # which allows you to get a numeric charlist back out. Basically, it looks
  # like Elixir has no issues converting the latin 1 back into the expected
  # characters.
  # So as a hack, I enforce all XML to be read initially as latin1. Doesn't feel
  # great, but it _appears_ to work.
  defp xml(data) do
    {xml_erl, _} =
      data
      |> enforce_latin_1()
      |> String.to_charlist()
      |> :xmerl_scan.string()

    xml_erl
  end

  # NOTE: if you have any insight into a better way to deal with encoding issues
  # here, then I would be happy to hear it. This feels like a wicked hack.
  defp enforce_latin_1(<<"<?xml version=\"1.0\" encoding=", rest::binary>>) do
    ~s[<?xml version="1.0" encoding="latin1"#{rest}]
  end

  defp enforce_latin_1(<<"<?xml version=\"1.0\"", rest::binary>>) do
    ~s[<?xml version="1.0" encoding="latin1"#{rest}]
  end

  defp enforce_latin_1(bin) do
    ~s[<?xml version="1.0" encoding="latin1"?>#{bin}]
  end
end
