defmodule HieApp.Repo.Migrations.CreateFormModel do
  use Ecto.Migration

  def change do
    create table(:formmodels) do
      add :data, :map

      timestamps
    end

  end
end
