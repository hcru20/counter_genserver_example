defmodule GenserverExample.Application do
  # For documentation and to make it clear this is an OTP Application module
  @moduledoc false

  # This module uses the `Application` behavior
  use Application

  def start(_type, _args) do
    # Define the list of child processes to be supervised
    children = [
      # Start the Counter GenServer
      {Counter, 0}
      # You can add other workers and supervisors to be supervised here
      # {SomeOtherWorker, arg},
    ]

    # Specify a strategy for the supervision tree.
    opts = [strategy: :one_for_one, name: GenserverExample.Supervisor]
    # Start the supervisor with the children processes
    Supervisor.start_link(children, opts)
  end
end

