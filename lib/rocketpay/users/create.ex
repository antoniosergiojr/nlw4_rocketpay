defmodule Rocketpay.Users.Create do
  #alias Ecto.Multi
  alias Rocketpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
