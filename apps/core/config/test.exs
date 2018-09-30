use Mix.Config

config :core, Core.Repo,[
  adapter: Ecto.Adapters.Postgres,
  database: "core_test",
  username: "postgres",
  password: "123456",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
]

config :core, ecto_repos: [Core.Repo]