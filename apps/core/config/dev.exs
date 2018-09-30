use Mix.Config

config :core, Core.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "core_repo",
  username: "postgres",
  password: "123456",
  hostname: "localhost"

config :core, ecto_repos: [Core.Repo]
