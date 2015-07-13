defmodule Raagtime.RagaView do
  use Raagtime.Web, :view

  def sort_arrow do
    raw "<img class='sort-arrow' src='/images/sort_arrow.gif'></img>"
  end

  @time_map %{
    "1" => "06-09",
    "2" => "09-12",
    "3" => "12-15",
    "4" => "15-18",
    "5" => "18-21",
    "6" => "21-24",
    "7" => "24-03",
    "8" => "03-06",
    "m" => "Monsoon",
  }

  def pretty_time(nil), do: ""
  def pretty_time(time) do
    Map.get(@time_map, time)
  end

  @chakra_positions %{
    "mooladhara" => "a",
    "swadisthan" => "b",
    "nabhi" => "c",
    "void" => "d",
    "heart" => "e",
    "vishuddhi" => "f",
    "agnya" => "g",
    "sahasrara" => "h",
  }

  def chakra_sort_value(nil), do: "zzz"
  def chakra_sort_value(""), do: "zzz"
  def chakra_sort_value(chakra) do
    Map.get @chakra_positions, actual_chakra(chakra)
  end

  def chakra_icon(nil), do: ""
  def chakra_icon(chakra) do
    raw "<img class='chakra-icon' src='/images/chakra-icon-#{actual_chakra chakra}.png'></img>"
  end

  def chakra_image(chakra) do
    raw "<img class='chakra-image' src='/images/chakra-#{actual_chakra chakra}.jpg'></img>"
  end

  @chakra_names %{
    "left_mooladhara" => "Left Mooladhara",
    "mooladhara" => "Mooladhara",
    "right_mooladhara" => "Right Mooladhara",
    "left_swadisthan" => "Left Swadisthan",
    "swadisthan" => "Swadisthan",
    "right_swadisthan" => "Right Swadisthan",
    "left_nabhi" => "Left Nabhi",
    "nabhi" => "Nabhi",
    "right_nabhi" => "Right Nabhi",
    "void" => "Void",
    "left_heart" => "Left Heart",
    "heart" => "Heart",
    "right_heart" => "Right Heart",
    "left_vishuddhi" => "Left Vishuddhi",
    "vishuddhi" => "Vishuddhi",
    "right_vishuddhi" => "Right Vishuddhi",
    "left_agnya" => "Left Agnya",
    "agnya" => "Agnya",
    "right_agnya" => "Right Agnya",
    "left_sahasrara" => "Left Sahastrara",
    "sahasrara" => "Sahastrara",
    "right_sahasrara" => "Right Sahastrara"
  }

  def pretty_chakra(chakra) do
    Map.get @chakra_names, chakra
  end

  def present?(nil), do: false
  def present?(""), do: false
  def present?(_), do: true

  # "left_nabhi" |> "nabhi"
  defp actual_chakra(chakra) do
    chakra |> String.split("_") |> List.last
  end
end
