defmodule Ui.PaymentsController do
  use Ui.Web, :controller
  alias Core.Management.Payments

  @doc """
    Usuário informa um txhash
    faz um post para create
    insere um novo Payment no banco de dados
    starta um novo processo que irá verificar se a transação foi confirmada
    criar um componente react que de tempos em tempos verifica se um pagamento
    foi concluído (:error ou :ok)
  """
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