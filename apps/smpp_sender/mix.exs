defmodule SmppSender.Mixfile do
  use Mix.Project

  def project do
    [
      app: :smpp_sender,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SmppSender.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poolboy, "~> 1.5"},
      {:redis_pool, in_umbrella: true},
      {:esme_pool, in_umbrella: true},
      {:json, "~> 1.0"}
    ]
  end
end
