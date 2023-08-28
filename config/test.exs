import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :group_draw, GroupDraw.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "group_draw_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :group_draw, GroupDrawWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "XV+yb64dG83Jv89k/isuflvt8Tf0h/5ZKE8arJDdbSGrYlp9E5Y55i/62xkNbPjn",
  server: false

# In test we don't send emails.
config :group_draw, GroupDraw.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
