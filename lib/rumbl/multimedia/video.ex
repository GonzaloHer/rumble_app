defmodule Rumbl.Multimedia.Video do
  use Ecto.Schema
  import Ecto.Changeset

  schema "videos" do
    field :url, :string
    field :description, :string
    field :title, :string
    belongs_to :user, Rumbl.Accounts.User
    belongs_to :category, Rumbl.Multimedia.Category
    # con la linea belongs_to :user, Rumb.Accounts.User hacemos que las tablas video y user se conecten, dice que la columna user_id en la tabla video corresponde a un usuario de la tabla User.

    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, [:url, :title, :description, :category_id])
    |> validate_required([:url, :title, :description])
    |> assoc_constraint(:category) # convierte los errores en mensajes de error que los humanos pueden leer.
  end
end
# Este archivo es responsable de identificar los campos que atan la base de datos y el strcut de elixir.
