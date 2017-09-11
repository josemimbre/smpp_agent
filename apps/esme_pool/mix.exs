defmodule EsmePool.Mixfile do
  use Mix.Project

  def project do
    [
      app: :esme_pool,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {EsmePool.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:smppex, "~> 2.2"},
      {:poolboy, "~> 1.5"},
      {:logger_file_backend, "~> 0.0.10"}
    ]
  end
end
