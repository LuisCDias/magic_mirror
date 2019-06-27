defmodule MagicMirrorWeb.DashboardController do
  use MagicMirrorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
