defmodule GroupDraw.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GroupDrawWeb.Telemetry,
      # Start the Ecto repository
      GroupDraw.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: GroupDraw.PubSub},
      # Start Finch
      {Finch, name: GroupDraw.Finch},
      # Start the Endpoint (http/https)
      GroupDrawWeb.Endpoint
      # Start a worker by calling: GroupDraw.Worker.start_link(arg)
      # {GroupDraw.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GroupDraw.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GroupDrawWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
