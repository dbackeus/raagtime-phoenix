defmodule Raagtime.Raga do
  use Raagtime.Web, :model

  schema "ragas" do
    field :title, :string
    field :thaat, :string
    field :ascending_scale, :string
    field :descending_scale, :string
    field :pakad, :string
    field :drone, :string
    field :samvaadi, :string
    field :vaadi, :string
    field :time, :string
    field :chakra, :string
    field :spotify_playlist_url, :string
    field :description, :string
    field :slug, :string

    has_many :clips, Raagtime.Clip

    timestamps
  end

  @required_fields ~w(title ascending_scale descending_scale slug)
  @optional_fields ~w(thaat pakad drone samvaadi vaadi time chakra spotify_playlist_url description)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
