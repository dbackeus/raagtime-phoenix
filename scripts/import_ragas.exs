alias Raagtime.Raga
alias Raagtime.Repo
import IO

{:ok, file} = File.read("db/ragas.json")
{:ok, ragas} = Poison.Parser.parse(file, keys: :atoms)

importer = fn (raga) ->
  puts "Importing #{raga.title}"

  raga = Map.put(raga, :slug, Map.get(raga, :url))
  changeset = Raga.changeset(%Raga{}, raga)

  if changeset.valid? do
    Repo.insert!(changeset)
  else
    puts "Failed to insert raga #{raga.title}"
    puts changeset.errors
  end
end

raga = ragas |> List.first
ragas |> Enum.each importer
