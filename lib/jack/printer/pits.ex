defmodule Jack.Printer.Pits do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pits" do
    field :omni_id, :integer
    field :ca, :string
    field :secretary, :string
    field :administrative_unit, :string
    field :street_and_number, :string
    field :suburb, :string
    field :postal_code, :string
    field :municipality, :string
    field :model, :string
    field :serie, :string
    field :repeated_series, :string
    field :delivered, :string
    field :delivered_date, :date
    field :is_installed, :boolean
    field :installed_date, :date
    field :reader, :string
    field :readen_taken, :boolean
    field :reading_date, :date
    field :copies, :integer
    field :prints, :integer
    field :digitizations, :integer
    field :color_copies, :integer
    field :color_prints, :integer
    field :uploaded_in_folder, :boolean
    field :observations, :string
    field :file_hash, :string

    timestamps()
  end

  def changeset(pits, attrs) do
    pits
    |> cast(attrs, [:omni_id, :ca, :secretary, :administrative_unit, :street_and_number,
                    :suburb, :postal_code, :municipality, :model, :serie,
                    :repeated_series, :reader, :readen_taken, :reading_date, :copies,
                    :prints,  :digitizations, :color_copies, :color_prints, :uploaded_in_folder,
                    :observations,  :file_hash])
    |> validate_required([])
  end
end
