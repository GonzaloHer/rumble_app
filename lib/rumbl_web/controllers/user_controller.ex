defmodule RumblWeb.UserController do
  use RumblWeb, :controller
  alias Rumbl.Accounts
  alias Rumbl.Accounts.User

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)

    # render en este caso renderiza la pagina index.html, proporciona un conjunto de datos llamado users que se utilizara en esa vista, la vista asociada a "idex.html" que es RumblWeb.UserView
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(id)
    render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)

    # esta funcion recibe un struct y retorna un Ecto.Changeset, changesets deja que ecto maneje los cambios en los registros, castear paramentros y hacer validaciones.
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: Routes.user_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
