defmodule HieApp.FormController do
  use HieApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
