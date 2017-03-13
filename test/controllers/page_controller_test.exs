defmodule TimestampEx.PageControllerTest do
  use TimestampEx.ConnCase

  test "GET / with natural timestamp", %{conn: conn} do
    conn = get conn, "/December%2015,%202015"

    assert json_response(conn, 200) == %{
      "unix" => 1450137600, "natural" => "December 15, 2015"
    }
  end

  test "GET / with unix timestamp", %{conn: conn} do
    conn = get conn, "/1450137600"

    assert json_response(conn, 200) == %{
      "unix" => 1450137600, "natural" => "December 15, 2015"
    }
  end
end
