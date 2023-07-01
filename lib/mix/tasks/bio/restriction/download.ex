defmodule Mix.Tasks.Bio.Restriction.Download do
  @moduledoc """
  This runs a series of downloads to get the relevant files from REBASE

  These are used to generate the restriction enzyme data.
  Requires your email and a directory as the only arguments. The email is used
  for the download of the data through FTP from REBASE. The directory is where
  the files should be downloaded to.
  """

  @shortdoc "Downloading restriction enzyme data"
  use Mix.Task
  alias Bio.Ansio, as: Ansio

  @options [email: :string, cache_dir: :string]
  @aliases [p: :email, d: :cache_dir]

  def run(inputs) do
    {opts, _, _} = OptionParser.parse(inputs, aliases: @aliases, strict: @options)

    cache_dir =
      cond do
        opts[:cache_dir] == nil -> :filename.basedir(:user_cache, "RestrictionEx")
        true -> opts[:cache_dir]
      end

    :ok = File.mkdir_p(cache_dir)

    host = "ftp.neb.com"

    :ftp.start()
    {:ok, pid} = :ftp.open(host |> String.to_charlist())
    :ok = :ftp.user(pid, 'anonymous', ~c(#{opts[:email]}))

    [
      "pub/rebase/emboss_e.",
      "pub/rebase/emboss_s.",
      "pub/rebase/emboss_r.",
      "pub/rebase/bairoch."
    ]
    |> Enum.map(fn p -> p <> Bio.Rebase.Emboss.date_term() end)
    |> Enum.map(fn p -> {p, Path.basename(p)} end)
    |> Enum.map(fn {path, target_filename} ->
      full_path = "#{cache_dir}/downloads_" <> target_filename

      cond do
        File.exists?(full_path) ->
          :ok
          Ansio.info("Skipping download of #{full_path}")

        true ->
          :ok = :ftp.recv(pid, ~c(#{path}), "#{cache_dir}/downloads_" <> target_filename)
      end
    end)

    :ftp.close(pid)
    :ftp.stop()
    Ansio.info("Download complete")
  end
end
