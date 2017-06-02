defmodule PhoenixLogger.MessageController do
  use PhoenixLogger.Web, :controller
  def redirector(conn, params) do
    IO.inspect(params)

    conn
    |> put_status(:ok)
    |> json(%{})
  end
end
