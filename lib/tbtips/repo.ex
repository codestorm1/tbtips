defmodule Tbtips.Repo do
  use Ecto.Repo,
    otp_app: :tbtips,
    adapter: Ecto.Adapters.Postgres
end
