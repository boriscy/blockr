defmodule Blockr.MixProject do
  use Mix.Project

  def project do
    [
      app: :blockr,
      version: "0.1.0",
      elixir: "~> 1.18.1",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:kino, "~> 0.11.0"}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:canvas, "~> 0.1.0", git: "https://github.com/groxio-learning/canvas.git", tag: "v0.1"}
    ]
  end
end
