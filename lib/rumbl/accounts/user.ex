defmodule Rumbl.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |>cast(attrs, [:name, :username])
    |>validate_required([:name, :username])
    |>validate_length(:username, min: 1, max: 20)
  end
  # un changeset se utiliza para respresentar y manejar cambios en los datos antes de insertarlos o actualizarlos en una base de datos.
  # en attrs quedan todos los datos nuevos o cambiados, la funcion cast se encarga de asignar los valores especificados en attrs a los campos :name y :username
  # cuando definimos un modulo que usa Ecto.Schema estamos creando una representacion de una tabla de base de datos en tu app Elixir. Esta rep incluye info sobre los campos de la tabla, sus tipos de datos, restricciones, relaciones con otras tablas, etc.
end
