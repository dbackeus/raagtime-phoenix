defmodule Raagtime.RagaController do
  use Raagtime.Web, :controller

  alias Raagtime.Raga
  alias Raagtime.Clip

  plug :scrub_params, "raga" when action in [:create, :update]

  def index(conn, _params) do
    query = from(r in Raga, order_by: r.title)
    ragas = Repo.all(query)
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

  def show(conn, %{"id" => slug}) do
    raga = Repo.get_by!(Raga, slug: slug) |> Repo.preload [:clips]
    clip_changeset = Clip.changeset(%Clip{})
    render(conn, "show.html", raga: raga, title: "Raag #{raga.title}", clip_changeset: clip_changeset)
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

  def add_clip(conn, %{"raga_id" => slug, "clip" => clip_params}) do
    raga = Repo.get_by!(Raga, slug: slug)

    url = "http://www.youtube.com/oembed?url=#{clip_params["url"]}"
    %HTTPotion.Response{body: body, status_code: status} = HTTPotion.get(url)

    path = raga_path(conn, :show, raga.slug)

    if status == 200 do
      oembed_info = Poison.decode! body

      changeset = Clip.changeset(%Clip{}, %{
        raga_id: raga.id,
        url: clip_params["url"],
        title: oembed_info["title"],
        thumbnail_url: oembed_info["thumbnail_url"],
        embed_code: oembed_info["html"]
      })

      if changeset.valid? do
        Repo.insert!(changeset)

        conn
        |> put_flash(:info, "The clip was successfully added.")
        |> redirect(to: path)
      else
        conn
        |> put_flash(:error, "Failed to add clip. Same clip had already been posted.")
        |> redirect(to: path)
      end
    else
      conn
      |> put_flash(:error, "Failed to add clip. Please make sure it's a valid YouTube URL.")
      |> redirect(to: path)
    end
  end
end
