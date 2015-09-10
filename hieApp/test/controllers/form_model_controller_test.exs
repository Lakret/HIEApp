defmodule HieApp.FormModelControllerTest do
  use HieApp.ConnCase

  alias HieApp.FormModel
  @valid_attrs %{data: %{}}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, form_model_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    form_model = Repo.insert! %FormModel{}
    conn = get conn, form_model_path(conn, :show, form_model)
    assert json_response(conn, 200)["data"] == %{"id" => form_model.id,
      "data" => form_model.data}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, form_model_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, form_model_path(conn, :create), form_model: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(FormModel, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, form_model_path(conn, :create), form_model: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    form_model = Repo.insert! %FormModel{}
    conn = put conn, form_model_path(conn, :update, form_model), form_model: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(FormModel, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    form_model = Repo.insert! %FormModel{}
    conn = put conn, form_model_path(conn, :update, form_model), form_model: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    form_model = Repo.insert! %FormModel{}
    conn = delete conn, form_model_path(conn, :delete, form_model)
    assert response(conn, 204)
    refute Repo.get(FormModel, form_model.id)
  end
end
