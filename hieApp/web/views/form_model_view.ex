defmodule HieApp.FormModelView do
  use HieApp.Web, :view

  def render("index.json", %{formmodels: formmodels}) do
    %{data: render_many(formmodels, HieApp.FormModelView, "form_model.json")}
  end

  def render("show.json", %{form_model: form_model}) do
    %{data: render_one(form_model, HieApp.FormModelView, "form_model.json")}
  end

  def render("form_model.json", %{form_model: form_model}) do
    %{id: form_model.id,
      data: form_model.data}
  end
end
