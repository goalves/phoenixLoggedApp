# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :phoenixLogger, PhoenixLogger.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FwQea57Mlz4yryrVBJ57k/gcBuVw3fDCkWj7et8riferpGeYTKw3wBMb35/9bzYY",
  render_errors: [view: PhoenixLogger.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixLogger.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger,
  backends: [:console, ExKafkaLogger],
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
