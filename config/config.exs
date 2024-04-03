import Config

config :ash_repro,
  ecto_repos: [AshRepro.Repo],
  ash_apis: [
    AshRepro.Accounts,
    AshRepro.Profiles
  ]

config :ash_repro, AshRepro.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "ash_manage_relationship_update_repo",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

import_config "#{config_env()}.exs"
