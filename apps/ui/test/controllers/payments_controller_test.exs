defmodule Ui.PaymentsControllerTest do
  use Ui.ConnCase
  alias Core.Management.Payments

  test "GET /api/payments", %{conn: conn} do
    {:ok, payment} = Payments.create(%{ txhash: "test" })

    response =
      conn
      |> get(payments_path(conn, :index))
      |> json_response(200)

    expected = %{
      "data" => [
        %{ "id" => payment.id, "txhash" => "test", "status" => nil }
      ]
    }

    assert length(response["data"]) > 0
  end

  test "GET /api/payments/<id>", %{conn: conn} do
    {:ok, payment} = Payments.create(%{ txhash: "test" })

    response =
      conn
      |> get(payments_path(conn, :show, payment.id))
      |> json_response(200)

    expected = %{
      "data" => %{ "id" => payment.id, "txhash" => "test", "status" => nil }
    }

    assert response == expected
  end

  test "POST /api/payments", %{conn: conn} do
    response =
      conn
      |> post(payments_path(conn, :create, txhash: "test"))
      |> json_response(200)

    assert response["data"]["txhash"] == "test"
  end
end
