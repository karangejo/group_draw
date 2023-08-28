defmodule GroupDraw.Repo do
  use Ecto.Repo,
    otp_app: :group_draw,
    adapter: Ecto.Adapters.Postgres
end
