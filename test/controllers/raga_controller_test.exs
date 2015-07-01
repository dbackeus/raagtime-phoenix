defmodule Raagtime.RagaControllerTest do
  use Raagtime.ConnCase

  alias Raagtime.Raga
  @valid_attrs %{ascending_scale: "some content", chakra: "some content", descending_scale: "some content", description: "some content", drone: "some content", pakad: "some content", samvaadi: "some content", slug: "some content", spotify_playlist_url: "some content", thaat: "some content", time: "some content", title: "some content", vaadi: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, raga_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing ragas"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, raga_path(conn, :new)
    assert html_response(conn, 200) =~ "New raga"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, raga_path(conn, :create), raga: @valid_attrs
    assert redirected_to(conn) == raga_path(conn, :index)
    assert Repo.get_by(Raga, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, raga_path(conn, :create), raga: @invalid_attrs
    assert html_response(conn, 200) =~ "New raga"
  end

  test "shows chosen resource", %{conn: conn} do
    raga = Repo.insert! %Raga{}
    conn = get conn, raga_path(conn, :show, raga)
    assert html_response(conn, 200) =~ "Show raga"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, raga_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    raga = Repo.insert! %Raga{}
    conn = get conn, raga_path(conn, :edit, raga)
    assert html_response(conn, 200) =~ "Edit raga"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    raga = Repo.insert! %Raga{}
    conn = put conn, raga_path(conn, :update, raga), raga: @valid_attrs
    assert redirected_to(conn) == raga_path(conn, :index)
    assert Repo.get_by(Raga, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    raga = Repo.insert! %Raga{}
    conn = put conn, raga_path(conn, :update, raga), raga: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit raga"
  end

  test "deletes chosen resource", %{conn: conn} do
    raga = Repo.insert! %Raga{}
    conn = delete conn, raga_path(conn, :delete, raga)
    assert redirected_to(conn) == raga_path(conn, :index)
    refute Repo.get(Raga, raga.id)
  end
end
