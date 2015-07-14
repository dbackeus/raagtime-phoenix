defmodule Raagtime.Repo.Migrations.CreateClip do
  use Ecto.Migration

  def change do
    create table(:clips) do
      add :raga_id, references(:ragas), null: false
      add :title, :string, null: false
      add :url, :string, null: false
      add :embed_code, :string
      add :thumbnail_url, :string

      timestamps
    end

    create index(:clips, [:raga_id])
  end
end
