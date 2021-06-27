defmodule JackWeb.UploadView do
  use JackWeb, :view

  def transform_size(value) do
    Sizeable.filesize(value, bits: true)
  end
end
