defmodule Rumbl.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string, null: false

      timestamps()
    end
    create unique_index(:categories, [:name]) # se usa para crear un idice unico en la tabla llamado :categories en la columna :name, osea no pueden haber duplicados en ese indice de la tabla.
  end
end
