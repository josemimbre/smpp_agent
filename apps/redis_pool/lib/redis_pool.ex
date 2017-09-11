defmodule RedisPool do
  @moduledoc """
  Documentation for RedisPool.
  """

  @doc """
  Hello world.

  ## Examples

      iex> RedisPool.hello
      :world

  """
  def q(args) do
    :poolboy.transaction(:redis_pool, fn(worker) -> :eredis.q(worker, args, 5000) end)
  end
end
