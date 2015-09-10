defmodule HieApp.FormModelController do
  use HieApp.Web, :controller

  alias HieApp.FormModel

  plug :scrub_params, "form_model" when action in [:create, :update]

  def index(conn, _params) do
    formmodels = Repo.all(FormModel)
    render(conn, "index.json", formmodels: formmodels)
  end

  def create(conn, %{"form_model" => form_model_params}) do
    changeset = FormModel.changeset(%FormModel{}, form_model_params)

    case Repo.insert(changeset) do
      {:ok, form_model} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", form_model_path(conn, :show, form_model))
        |> render("show.json", form_model: form_model)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(HieApp.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    form_model = Repo.get!(FormModel, id)
    render conn, "show.json", form_model: form_model
  end

  def update(conn, %{"id" => id, "form_model" => form_model_params}) do
    form_model = Repo.get!(FormModel, id)
    changeset = FormModel.changeset(form_model, form_model_params)

    case Repo.update(changeset) do
      {:ok, form_model} ->
        render(conn, "show.json", form_model: form_model)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(HieApp.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    form_model = Repo.get!(FormModel, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(form_model)

    send_resp(conn, :no_content, "")
  end
end
