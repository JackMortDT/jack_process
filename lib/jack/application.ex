defmodule Jack.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Jack.Repo,
      # Start the Telemetry supervisor
      JackWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Jack.PubSub},
      # Start the Endpoint (http/https)
      JackWeb.Endpoint
      # Start a worker by calling: Jack.Worker.start_link(arg)
      # {Jack.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Jack.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    JackWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
