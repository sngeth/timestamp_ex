defmodule TimestampEx.PageController do
  use TimestampEx.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
