defmodule Rumbl.Repo do
  use Ecto.Repo,
    otp_app: :rumbl,
    adapter: Ecto.Adapters.Postgres
end

# El modulo se utiliza para interactuar con la base de datos PostgreSQL y proporciona una capa de abtraccion sobre la base de datos para realizar operaciones en los registros de la base de datos.
