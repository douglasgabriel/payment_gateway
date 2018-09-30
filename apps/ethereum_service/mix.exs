defmodule EthereumService.MixProject do
  use Mix.Project

  def project do
    [
      app: :ethereum_service,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 2.0"},
      {:httpoison, "~> 1.3"},
      {:mock, "~> 0.3.0", only: :test}
    ]
  end
end
