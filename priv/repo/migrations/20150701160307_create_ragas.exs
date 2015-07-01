defmodule Raagtime.Repo.Migrations.CreateRagas do
  use Ecto.Migration

  def change do
    create table(:ragas) do
      add :title, :string
      add :thaat, :string
      add :ascending_scale, :string
      add :descending_scale, :string
      add :pakad, :string
      add :drone, :string
      add :samvaadi, :string
      add :vaadi, :string
      add :time, :string
      add :chakra, :string
      add :spotify_playlist_url, :string
      add :description, :string
      add :slug, :string

      timestamps
    end

    create index(:ragas, [:title], unique: true)
    create index(:ragas, [:slug], unique: true)
  end
end
