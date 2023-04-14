defmodule Gameapp.Repo do
  use Ecto.Repo,
    otp_app: :gameapp,
    adapter: Ecto.Adapters.Postgres
end
