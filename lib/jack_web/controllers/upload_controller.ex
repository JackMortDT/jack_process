defmodule JackWeb.UploadController do
  use JackWeb, :controller

  alias Jack.Documents

  def index(conn, _params) do
    uploads = Documents.list_uploads()
    render(conn, "index.html", uploads: uploads)
  end

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"upload" => %Plug.Upload{}=upload}) do
    case Documents.create_upload_from_plug_upload(upload) do
      {:ok, _upload} ->
        put_flash(conn, :info, "file uploaded correctly")
        redirect(conn, to: Routes.upload_path(conn, :index))
      {:error, reason} ->
        put_flash(conn, :error, "error upload file: #{inspect(reason)}")
        render(conn, "new.html")
    end
  end
end
