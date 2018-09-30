defmodule Core do
  @moduledoc """
  This APP is responsible to provide shared entities
  to every APPs in the umbrella, and also provide
  database comunication.
  """

  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      Core.Repo
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
