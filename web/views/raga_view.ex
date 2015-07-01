defmodule Raagtime.RagaView do
  use Raagtime.Web, :view

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

  def chakra_icon(nil), do: ""

  def chakra_icon(chakra) do
    chakra = chakra |> String.split("_") |> List.last
    raw "<img src='/images/chakra-icon-#{chakra}.png'></img>"
  end


end
