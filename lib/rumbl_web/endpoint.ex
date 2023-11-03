defmodule RumblWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :rumbl

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_rumbl_key",
    signing_salt: "ZX6yBLRW"
  ]

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]
  socket "/socket", RumblWeb.UserSocket, websocket: true, longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :rumbl,
    gzip: false,
    only: ~w(assets fonts images favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :rumbl
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug RumblWeb.Router
end

# - Manejo de Solicitudes HTTP: El endpoint recibe las solicitudes HTTP entrantes, las enruta a las rutas correspondientes y las procesa según las reglas definidas en tu aplicación.

# - Definición de Plugs Globales: En el endpoint, puedes definir plugs que se aplicarán a nivel global a todas las solicitudes entrantes. Estos plugs son funciones que se ejecutan
# antes de que la solicitud llegue a los controladores y se utilizan para tareas como la autenticación, la configuración de encabezados o la manipulación de la solicitud.

# - Configuración General: El endpoint es donde puedes configurar aspectos generales de tu aplicación, como el tipo de contenido admitido (JSON, HTML, etc.), el manejo de errores y la configuración del servidor web.

# - Gestión de WebSockets: Si tu aplicación utiliza WebSockets para comunicación en tiempo real, el endpoint también se encarga de gestionar las conexiones WebSocket.
