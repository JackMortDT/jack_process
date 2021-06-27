defmodule Jack.Repo.Migrations.AddPits do
  use Ecto.Migration

  def change do
    create table(:pits) do
      add :omni_id, :integer
      add :ca, :string
      add :secretary, :string
      add :administrative_unit, :string
      add :street_and_number, :string
      add :suburb, :string
      add :postal_code, :string
      add :municipality, :string
      add :model, :string
      add :serie, :string
      add :repeated_series, :string
      add :delivered, :string
      add :delivered_date, :date
      add :is_installed, :boolean
      add :installed_date, :date
      add :reader, :string
      add :readen_taken, :boolean
      add :reading_date, :date
      add :copies, :integer
      add :prints, :integer
      add :digitizations, :integer
      add :color_copies, :integer
      add :color_prints, :integer
      add :uploaded_in_folder, :boolean
      add :observations, :string
      add :file_hash, :string

      timestamps()
    end
  end
end
