use Mix.Config

config :esme_pool,
  hostname: '127.0.0.1',
  port: 2775,
  system_id: "system_id",
  password: "password",
  pool_size: 1,
  pool_max: 0

# config :logger,
#  backends: [{LoggerFileBackend, :info},
#             {LoggerFileBackend, :error}]
#
# config :logger, :info,
#  path: "log/esme_pool.log",
#  level: :info
#
# config :logger, :error,
#  path: "log/esme_pool_error.log",
#  level: :error
