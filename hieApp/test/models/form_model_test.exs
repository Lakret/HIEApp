defmodule HieApp.FormModelTest do
  use HieApp.ModelCase

  alias HieApp.FormModel

  @valid_attrs %{data: %{}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = FormModel.changeset(%FormModel{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = FormModel.changeset(%FormModel{}, @invalid_attrs)
    refute changeset.valid?
  end
end
