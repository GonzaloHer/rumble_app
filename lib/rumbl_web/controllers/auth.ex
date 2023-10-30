defmodule RumblWeb.Auth do
  import Plug.Conn
  import Phoenix.Controller
  alias RumblWeb.Router.Helpers, as: Routes

  def init(opts), do: opts

  def call(conn, _opts) do
    # la funcion get_session sale desde el import de Plug.Conn
    user_id = get_session(conn, :user_id)
    user = user_id && Rumbl.Accounts.get_user(user_id)
    assign(conn, :current_user, user)
    # estoy asignanado un atributo a conn llamada "current_user" para saber cual es el usuario que esta logeado.
  end

  @spec login(Plug.Conn.t(), atom() | %{:id => any(), optional(any()) => any()}) :: Plug.Conn.t()
  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  def logout(conn) do
    configure_session(conn, drop: true)
  end

  @spec authenticate_user(
          atom()
          | %{
              :assigns => atom() | %{:current_user => any(), optional(any()) => any()},
              optional(any()) => any()
            },
          any()
        ) :: atom() | %{:assigns => atom() | map(), optional(any()) => any()}
  def authenticate_user(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end

end
