defmodule Rocketpay.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RocketpayWeb.Telemetry,
      # Start the Ecto repository
      Rocketpay.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Rocketpay.PubSub},
      # Start Finch
      {Finch, name: Rocketpay.Finch},
      # Start the Endpoint (http/https)
      RocketpayWeb.Endpoint
      # Start a worker by calling: Rocketpay.Worker.start_link(arg)
      # {Rocketpay.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Rocketpay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RocketpayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
