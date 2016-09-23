defmodule Mix.Tasks.Whitebox.PopulateDB do
  use Mix.Task

  @shortdoc "Populates the DB with the data from mongodump json"

  def run(args) do
    IO.puts "hello"
    Mix.shell.info inspect(args)
  end

end

