defmodule Raagtime.ClipTest do
  use Raagtime.ModelCase

  alias Raagtime.Clip

  @valid_attrs %{raga_id: 1, embed_code: "some content", thumbnail_url: "some content", title: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Clip.changeset(%Clip{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Clip.changeset(%Clip{}, @invalid_attrs)
    refute changeset.valid?
  end
end
