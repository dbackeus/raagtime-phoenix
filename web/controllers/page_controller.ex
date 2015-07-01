defmodule Raagtime.PageController do
  use Raagtime.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
