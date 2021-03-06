defmodule Wander.Mixfile do
  use Mix.Project

  def project do
    [app: :wander,
     version: "0.4.1",
     elixir: "~> 1.2.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:cowboy, :plug, :logger, :gproc],
     mod: {Wander.API.App, []},
     env: [cowboy_port: 4000]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [ {:excheck, "~> 0.3", only: :test},
      {:triq, github: "krestenkrab/triq", only: :test},
      {:cowboy, "~> 1.0.0"}, {:plug, "== 1.1.3"},
      {:earmark, "~> 0.1", only: :dev}, {:ex_doc, "~> 0.11", only: :dev},
      {:gproc, "0.3.1"},
      {:dogma, "~> 0.1", only: :dev},
      {:credo, "~> 0.3", only: [:dev, :test]} ]
  end

end
