defmodule PlugEx.Router do
  use Plug.Router

  plug :match
  plug :dispatch
  plug Plug.Static, at: "/home", from: :server

  # route
  get "/" do
    send_resp(conn, 200, "Hello world")
  end

  #dynamic route
  get "/say_hello/:name" do
    send_resp(conn, 200, "Hello #{name}")
  end

  # serving an html hile
  get "/home" do
    conn = put_resp_content_type(conn, "text/html")
    send_file(conn, 200, "static/index.html")
  end

  match _, do: send_resp(conn, 404, "404 not found")
end
