defmodule Ui.PageControllerTest do
  use Ui.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "<main id=\"root\"></main>"
  end
end
