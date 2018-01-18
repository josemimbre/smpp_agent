use Mix.Config

config :smpp_sender,
  pool_size: 1,
  pool_max: 0,
  redis_queue: 'foo'
