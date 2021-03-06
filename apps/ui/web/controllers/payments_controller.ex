defmodule Ui.PaymentsController do
  use Ui.Web, :controller
  alias Core.Management.Payments

  def index(conn, _params) do
    render(conn, "index.json", payments: Payments.all)
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.json", payment: Payments.find(id))
  end

  def create(conn, %{"txhash" => txhash}) do
    case Payments.create(%{ txhash: txhash }) do
      {:ok, payment} ->
        render(conn, "show.json", payment: payment)
      {:error, error} ->
        render(conn, "error.json", error: error)
    end
  end
end
