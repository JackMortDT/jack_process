defmodule JackWeb.UploadController do
  use JackWeb, :controller

  alias Jack.Documents
  alias Jack.Documents.Upload

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

  def show(conn, %{"id" => id}) do
    upload = Documents.get_upload!(id)
    local_path = Upload.local_path(upload.id, upload.filename)
    send_download(conn, {:file, local_path}, filename: upload.filename)
  end

  def thumbnail(conn, %{"upload_id" => id}) do
    thumb_path = Upload.thumbnail_path(id)

    conn
    |> put_resp_content_type("image/jpeg")
    |> send_file(200, thumb_path)
  end
end
