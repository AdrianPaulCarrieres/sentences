# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sentences,
  ecto_repos: [Sentences.Repo]

# Configures the endpoint
config :sentences, SentencesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IAQTO2GCDrdoaHqY4TRwSnvCnhAsOH41vSD20x5IXfOPo7MI4RTvg/95PS5y+UYl",
  render_errors: [view: SentencesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Sentences.PubSub,
  live_view: [signing_salt: "5rSPFib2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
