# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rocketpay,
  ecto_repos: [Rocketpay.Repo]

# Configures the endpoint
config :rocketpay, RocketpayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "W71V6C4+cpuhcp8GQTIrquTyVsu7aTJuF7qu/1qjDpVEYW9GamUb+bSE0Qhhrb4K",
  render_errors: [view: RocketpayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Rocketpay.PubSub,
  live_view: [signing_salt: "olVk6O9T"]

config :rocketpay, Rocketpay.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :rocketpay, :basic_auth,
  username: "teste", # pegar pela variavel de ambiente para não expor o usuário no código = System.get_env("USER")
  password: "123" # pegar pela variavel de ambiente para não expor a senha no código = System.get_env("PASS")
  # header auth = teste:123 = base64 dGVzdGU6MTIz

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
