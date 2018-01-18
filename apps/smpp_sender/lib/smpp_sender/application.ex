defmodule SmppSender.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised

    poolboy_config = [
      name: {:local, :smpp_sender},
      worker_module: SmppSender.Worker,
      size: Application.get_env(:smpp_sender, :pool_size),
      max_overflow: Application.get_env(:smpp_sender, :pool_max)
    ]

    redis_queue_name = Application.get_env(:smpp_sender, :redis_queue)

    children = [
      :poolboy.child_spec(:smpp_sender, poolboy_config, [redis_queue_name])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SmppSender.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
