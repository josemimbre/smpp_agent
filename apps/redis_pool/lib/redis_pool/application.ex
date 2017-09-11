defmodule RedisPool.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do

    poolboy_config = [
      name: {:local, :redis_pool},
      worker_module: :eredis,
      size: Application.get_env(:redis_pool, :pool_size),
      max_overflow: Application.get_env(:redis_pool, :pool_max)
    ]

    eredis_args = [
      host: Application.get_env(:redis_pool, :host),
      port: Application.get_env(:redis_pool, :port)
    ]

    children = [
      :poolboy.child_spec(:redis_pool, poolboy_config, eredis_args)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RedisPool.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
