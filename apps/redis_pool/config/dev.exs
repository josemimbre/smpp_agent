use Mix.Config

config :redis_pool,
  host: '127.0.0.1',
  port: 6379,
  pool_size: 50,
  pool_max: 100
