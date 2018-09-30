defmodule PaymentChecker.MixProject do
  use Mix.Project

  def project do
    [
      app: :payment_checker,
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
      extra_applications: [:logger, :core, :ethereum_service]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:core, in_umbrella: true},
      {:ethereum_service, in_umbrella: true},
    ]
  end
end
