defmodule Bio.IO.SnapGene do
  @dna 0x00
  @primers 0x05
  @notes 0x06
  @cookie 0x09
  @features 0x0A

  def read(filename) do
    case File.read(filename) do
      {:ok, content} ->
        {:ok, parse(content, %{})}

      not_ok ->
        not_ok
    end
  end

  defp parse(<<>>, output) do
    output
  end

  # A SnapGene file is made of packets, each packet being a TLV-like
  # structure comprising:
  #   - 1 single byte indicating the packet's type;
  #   - 1 big-endian long integer (4 bytes) indicating the length of the
  #     packet's data;
  #   - the actual data.
  defp parse(data, output) do
    <<packet_type::size(8), content::binary>> = data
    <<packet_length::size(32), content::binary>> = content
    <<packet_content::binary-size(packet_length), content::binary>> = content

    case packet_type do
      @dna ->
        content |> parse(Map.merge(output, parse_dna(packet_content)))

      @primers ->
        content |> parse(Map.merge(output, parse_primers(packet_content)))

      @notes ->
        content |> parse(Map.merge(output, parse_notes(packet_content)))

      @cookie ->
        content |> parse(Map.merge(output, parse_cookie(packet_content)))

      @features ->
        content |> parse(Map.merge(output, parse_features(packet_content)))

      _ ->
        parse(content, output)
    end
  end

  defp parse_dna(data) do
    <<circular::size(8), rest::binary>> = data
    circular = Bitwise.band(circular, 0x01) == 1
    %{dna: rest, circular?: circular}
  end

  defp parse_notes(data) do
    %{notes: xml(data)}
  end

  defp parse_features(data) do
    %{features: xml(data)}
  end

  defp parse_primers(data) do
    %{primers: xml(data)}
  end

  defp parse_cookie(<<check::binary-size(8), _::binary>>) do
    %{valid?: check == "SnapGene"}
  end

  defp xml(data) do
    {xml_erl, _} =
      data
      |> :erlang.binary_to_list()
      |> :xmerl_scan.string()

    xml_erl
  end
end
