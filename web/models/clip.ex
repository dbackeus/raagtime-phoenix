defmodule Raagtime.Clip do
  use Raagtime.Web, :model

  schema "clips" do
    field :title, :string
    field :url, :string
    field :embed_code, :string
    field :thumbnail_url, :string

    belongs_to :raga, Raagtime.Raga

    timestamps
  end

  @required_fields ~w(raga_id title url embed_code thumbnail_url)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_unique(:url, on: Raagtime.Repo)
  end
end
