# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Whitebox.Repo.insert!(%Whitebox.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Mix.Tasks.Whitebox.Seed do
  require Logger

  def run(args) do
    json_file= Enum.at(args, 0)
    File.stream!(json_file)
      |> CSV.decode(separator: ?,)
      |> Enum.map(fn(row) ->
      end)
  end
end


# Mix.Tasks.Whitebox.Seed.run(System.argv)
