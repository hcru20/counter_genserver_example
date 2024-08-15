defmodule GenserverExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :genserver_example,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      # Specify the application's start module
      mod: {GenserverExample.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end
end

