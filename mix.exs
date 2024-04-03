defmodule AshRepro.MixProject do
  use Mix.Project

  def project do
    [
      app: :ash_repro,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {AshRepro.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ash, "== 2.21.6"},
      {:ash_postgres, "== 1.5.23"}
    ]
  end
end
