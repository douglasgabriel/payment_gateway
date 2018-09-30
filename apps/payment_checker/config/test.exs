use Mix.Config

config :payment_checker, Core.Repo,[
  adapter: Ecto.Adapters.Postgres,
  database: "core_test",
  username: "postgres",
  password: "123456",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
]

config :payment_checker, ecto_repos: [Core.Repo]
