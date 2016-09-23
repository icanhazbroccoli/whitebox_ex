# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :whitebox, Whitebox.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "XQVPyky1Q9ampRMi/POCkD8Wt84x6Lysm+MosHq0Ue5lTOmxb/mpF+QjhsuQ7yEP",
  render_errors: [accepts: ~w(html)],
  pubsub: [name: Whitebox.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :whitebox, ecto_repos: [Whitebox.Repo,]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
