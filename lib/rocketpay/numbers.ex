defmodule Rocketpay.Numbers do
  #|> = pipe operator passa por parametro o comando anterior para o método.
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  # defp = função privada
  defp handle_file({:ok, file}) do
    result =
      file
      |> String.split(",")
      |> Stream.map(fn number -> String.to_integer(number) end) #Stream = operador lazy, mas poderia ser Enum
      |> Enum.sum()

    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file"}}
end
