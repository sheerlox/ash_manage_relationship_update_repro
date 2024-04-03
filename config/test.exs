import Config

config :logger, level: :warning

config :ash, :disable_async?, true
config :ash, :missed_notifications, :ignore
