defmodule AshRepro.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AshRepro.Repo
    ]

    opts = [strategy: :one_for_one, name: AshRepro.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
