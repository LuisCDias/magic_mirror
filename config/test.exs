use Mix.Config

# Configure your database
config :magic_mirror, MagicMirror.Repo,
  username: "postgres",
  password: "postgres",
  database: "magic_mirror_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :magic_mirror, MagicMirrorWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
