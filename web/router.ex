defmodule PhoenixLogger.Router do
  use PhoenixLogger.Web, :router

  pipeline :browser do
    plug :accepts, ["json"]
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixLogger do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    post "/message", MessageController, :redirector
  end

  defp handle_errors(conn, %{kind: level, reason: reason, stack: stacktrace}) do
    response = ExKafkaLogger.HttpError.template(conn.status)
    json(conn, response)
  end

  defp handle_errors(_, _), do: nil

end
