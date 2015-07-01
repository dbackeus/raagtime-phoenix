defmodule Raagtime.RagaController do
  use Raagtime.Web, :controller

  alias Raagtime.Raga

  plug :scrub_params, "raga" when action in [:create, :update]

  def index(conn, _params) do
    ragas = Repo.all(Raga)
    render(conn, "index.html", ragas: ragas, title: "Listing Ragas")
  end

  def new(conn, _params) do
    changeset = Raga.changeset(%Raga{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"raga" => raga_params}) do
    changeset = Raga.changeset(%Raga{}, raga_params)

    if changeset.valid? do
      Repo.insert!(changeset)

      conn
      |> put_flash(:info, "Raga created successfully.")
      |> redirect(to: raga_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    raga = Repo.get!(Raga, id)
    render(conn, "show.html", raga: raga, title: "Raag #{raga.title}")
  end

  def edit(conn, %{"id" => id}) do
    raga = Repo.get!(Raga, id)
    changeset = Raga.changeset(raga)
    render(conn, "edit.html", raga: raga, changeset: changeset)
  end

  def update(conn, %{"id" => id, "raga" => raga_params}) do
    raga = Repo.get!(Raga, id)
    changeset = Raga.changeset(raga, raga_params)

    if changeset.valid? do
      Repo.update!(changeset)

      conn
      |> put_flash(:info, "Raga updated successfully.")
      |> redirect(to: raga_path(conn, :index))
    else
      render(conn, "edit.html", raga: raga, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    raga = Repo.get!(Raga, id)
    Repo.delete!(raga)

    conn
    |> put_flash(:info, "Raga deleted successfully.")
    |> redirect(to: raga_path(conn, :index))
  end
end
