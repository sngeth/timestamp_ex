defmodule TimestampEx.PageController do
  use TimestampEx.Web, :controller

  def index(conn, %{"date" => date}) do
    render conn, "index.json", date: date
  end
end
