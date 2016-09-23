ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Whitebox.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Whitebox.Repo --quiet)
Ecto.Adapters.SQL.Sandbox.mode(Whitebox.Repo, :manual)

