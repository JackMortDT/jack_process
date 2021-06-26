defmodule JackWeb.UploadController do
  use JackWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"upload" => %Plug.Upload{}=upload}) do
    IO.inspect(upload, label: "upload")
    text conn, "ok"
  end
end
