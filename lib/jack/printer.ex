defmodule Jack.Printer do
  import Ecto.Query, warn: false

  alias Jack.Repo
  alias Jack.Documents
  alias Jack.Printer.Pits
  alias Jack.Printer.Sandoval
  alias Jack.Documents.Upload
  alias Jack.Printer.ModelUtil

  def list_sandoval do
    Repo.all(Sandoval)
  end

  def list_pits do
    Repo.all(Pits)
  end

  def get_sandoval_by_hash(hash) do
    Sandoval
    |> where([s], s.file_hash == ^hash)
    |> Repo.all()
  end

  def get_pits_by_hash(hash) do
    Pits
    |> where([p], p.file_hash == ^hash)
    |> Repo.all()
  end

  def process_file(id, type) do
    data = get_xlsx_data(id)
    ModelUtil.list_to_model(data, type)
  end

  def get_xlsx_data(id) do
    upload = Documents.get_upload!(id)
    {:ok, file} =
      id
      |> Upload.local_path(upload.filename)
      |> Xlsxir.multi_extract(0)

    rows = file
    |> Xlsxir.get_list()
    {rows, upload.hash}
  end

end
