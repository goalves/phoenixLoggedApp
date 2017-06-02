use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :phoenixLogger, PhoenixLogger.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]]


# Watch static and templates for browser reloading.
config :phoenixLogger, PhoenixLogger.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

config :ex_kafka_logger,
  kafka_topic: "logging",
  service_name: "phoenix-app-logged"

config :kafka_ex,
  brokers: [
    {"127.0.0.1", 9092},
  ],
  consumer_group: "test-consumergroup",
  disable_default_worker: false,
  sync_timeout: 3000,
  max_restarts: 10,
  max_seconds: 60,
  use_ssl: false,
  kafka_version: "0.9.0",
  topic: "test"


# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20
