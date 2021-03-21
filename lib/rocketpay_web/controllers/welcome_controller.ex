defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  alias Rocketpay.Numbers

  #função
  # sempre em uma action de uma controller deve-se ter uma conexão (conn)
  def index(conn, %{"filename" => filename}) do
    #text(conn, "Welcome to the Rocketpay API")
    filename
    |> Numbers.sum_from_file()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    #|> IO.inspect()
    |> json(%{message: "Welcome to Rocketpay API. Here is your number #{result}"})
  end

  defp handle_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)
  end
end
