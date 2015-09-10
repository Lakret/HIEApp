defmodule HieApp.FormDataView do
  use HieApp.Web, :view

  def render("index.json", data) do
    data
  end
end
