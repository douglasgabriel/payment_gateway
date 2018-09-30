ExUnit.start()
{:ok, _pid} = Core.Repo.start_link
Ecto.Adapters.SQL.Sandbox.mode(Core.Repo, :manual)
