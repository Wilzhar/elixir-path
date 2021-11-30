defmodule PlugProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: PlugProject.Router, options: [port: cowboy_port()]}
      # Starts a worker by calling: PlugProject.Worker.start_link(arg)
      # {PlugProject.Worker, arg}
    ]

    Logger.info("Starting application on port #{cowboy_port()}...")

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PlugProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp cowboy_port, do: Application.get_env(:plug_project, :cowboy_port, 8080)
end
