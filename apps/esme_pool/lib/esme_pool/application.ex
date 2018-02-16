defmodule EsmePool.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    poolboy_config = [
      name: {:local, :esme_pool},
      worker_module: EsmePool.Connection,
      size: Application.get_env(:esme_pool, :pool_size),
      max_overflow: Application.get_env(:esme_pool, :pool_max)
    ]

    esme_config = [
      Application.get_env(:esme_pool, :hostname),
      Application.get_env(:esme_pool, :port),
      Application.get_env(:esme_pool, :system_id),
      Application.get_env(:esme_pool, :password)
    ]

    children = [
      :poolboy.child_spec(:esme_pool, poolboy_config, esme_config)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EsmePool.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
