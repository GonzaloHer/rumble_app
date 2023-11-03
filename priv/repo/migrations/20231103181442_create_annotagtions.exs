defmodule Rumbl.Repo.Migrations.CreateAnnotagtions do
  use Ecto.Migration

  def change do
    create table(:annotagtions) do
      add :body, :text
      add :at, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :video_id, references(:videos, on_delete: :nothing)

      timestamps()
    end

    create index(:annotagtions, [:user_id])
    create index(:annotagtions, [:video_id])
  end
end
