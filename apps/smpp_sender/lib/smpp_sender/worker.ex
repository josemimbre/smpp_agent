defmodule SmppSender.Worker do
  @moduledoc false
  use Task
  require Logger

  def start_link(redis_queue_name) do
    Task.start_link(__MODULE__, :run, redis_queue_name)
  end

  def get_message(queue, command \\ 'BLPOP', timeout \\ '4') do
    RedisPool.q([command, queue, timeout])
  end

  def send_message(:undefined) do
    Logger.info("Redis command Timeout")
  end

  def send_message([_queue, message]) do
    Logger.info("Sending message")
    {:ok, list} = JSON.decode(message)
    from = list["from"]
    to = list["destination"]
    text = list["text"]
    Logger.info("from: #{inspect(from)} - to: #{inspect(to)} - text: #{inspect(text)}")
    EsmePool.send_message(%EsmePool.Message{from: {from, 1, 1}, to: {to, 1, 1}, text: text})
  end

  def run(redis_queue_name) do
    {:ok, result} = get_message(redis_queue_name)
    send_message(result)
  end
end
