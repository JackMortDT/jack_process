defmodule Jack.Repo.Migrations.AddSandoval do
  use Ecto.Migration

  def change do
    create table(:sandoval) do
      add :cvo, :integer
      add :nvo_id, :integer
      add :organism, :string
      add :secretary, :string
      add :administrative_unit, :string
      add :street_and_number, :string
      add :suburb, :string
      add :postal_code, :string
      add :municipality, :string
      add :model, :string
      add :double_letter, :boolean
      add :table, :boolean
      add :extra_equipment, :boolean
      add :connection_cable, :string
      add :regulator, :boolean
      add :hi_print_notes, :string
      add :contact_or_responsabe, :string
      add :phone, :string
      add :email, :string
      add :clasification, :string
      add :status, :string
      add :who_receives, :string
      add :ip_connection, :string
      add :serie, :string
      add :is_delivered, :boolean
      add :delivered_date, :date
      add :is_installed, :boolean
      add :instalation_date, :date
      add :observations, :string
      add :comentaries, :string
      add :file_hash, :string

      timestamps()
    end
  end
end
