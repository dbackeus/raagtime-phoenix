defmodule Raagtime.RagaTest do
  use Raagtime.ModelCase

  alias Raagtime.Raga

  @valid_attrs %{
    title: "some content",
    ascending_scale: "some content",
    descending_scale: "some content",
    slug: "some-content"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Raga.changeset(%Raga{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Raga.changeset(%Raga{}, @invalid_attrs)
    refute changeset.valid?
  end
end
