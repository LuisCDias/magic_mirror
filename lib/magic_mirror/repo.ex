defmodule MagicMirror.Repo do
  use Ecto.Repo,
    otp_app: :magic_mirror,
    adapter: Ecto.Adapters.Postgres
end
