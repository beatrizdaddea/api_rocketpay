defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User

  def create(conn, params) do
    params
    |> Rocketpay.create_user()
    |> handle_response(conn)
  end

  def handle_response({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  def handle_response({:error, changeset}, conn) do
    conn
    |> put_status(:unprocessable_entity)
    |> render("errors.json", changeset: changeset)
  end

end
