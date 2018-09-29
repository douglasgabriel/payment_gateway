defmodule Ui.PaymentsView do
  use Ui.Web, :view
  alias Ui.PaymentsView

  def render("index.json", %{payments: payments}) do
    %{data: render_many(payments, PaymentsView, "payment.json")}
  end

  def render("show.json", %{payment: payment}) do
    %{data: render_one(payment, PaymentsView, "payment.json")}
  end

  def render("error.json", %{error: error}) do
    %{error: error}
  end

  def render("payment.json", %{payments: payment}) do
    %{
      id:     payment.id,
      txhash: payment.txhash,
      status: payment.status
    }
  end
end