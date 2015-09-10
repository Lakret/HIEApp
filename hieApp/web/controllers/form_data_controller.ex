defmodule HieApp.FormDataController do
  use HieApp.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, data: "{}"
  end
end
