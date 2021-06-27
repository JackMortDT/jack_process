defmodule Jack.Printer.Sandoval do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sandoval" do
    field :cvo, :integer
    field :nvo_id, :integer
    field :organism, :string
    field :secretary, :string
    field :administrative_unit, :string
    field :street_and_number, :string
    field :suburb, :string
    field :postal_code, :string
    field :municipality, :string
    field :model, :string
    field :double_letter, :boolean
    field :table, :boolean
    field :extra_equipment, :boolean
    field :connection_cable, :string
    field :regulator, :boolean
    field :hi_print_notes, :string
    field :contact_or_responsabe, :string
    field :phone, :string
    field :email, :string
    field :clasification, :string
    field :status, :string
    field :who_receives, :string
    field :ip_connection, :string
    field :serie, :string
    field :is_delivered, :boolean
    field :delivered_date, :date
    field :is_installed, :boolean
    field :instalation_date, :date
    field :observations, :string
    field :comentaries, :string
    field :file_hash, :string

    timestamps()
  end

  def changeset(sandoval, attrs) do
    sandoval
    |> cast(attrs, [:cvo, :nvo_id, :organism, :secretary, :administrative_unit, :street_and_number,
                    :suburb, :postal_code, :municipality, :model, :double_letter,
                    :table, :extra_equipment, :connection_cable, :regulator, :hi_print_notes,
                    :contact_or_responsabe, :phone, :email, :clasification, :status,
                    :who_receives, :ip_connection, :serie, :is_delivered, :delivered_date,
                    :is_installed, :instalation_date, :observations, :comentaries, :file_hash])
    |> validate_required([])
  end
end
