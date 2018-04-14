defmodule HolidaysEx do
  @moduledoc """
  Documentation for HolidaysEx.
  """

  @doc """
  Generate JSON data of Holidays in Japan.

  ## Examples

      iex> HolidaysEx.to_json
      "{\"2019-11-03\":\"文化の日\",\"2018-09-23\":\"秋分の日\"...

  """
  def to_json() do
    generate_map_data() |> Poison.encode!
  end

  @doc """
  Specifying a date returns a holiday's name.

  ## Examples

      iex> HolidaysEx.name?("2019-11-03")
      "文化の日"

  """
  def name?(date) do
    generate_map_data() |> Map.fetch!(date)
  end

  @doc """
  Specifying a name returns a holiday's date.

  ## Examples

      iex> HolidaysEx.date?("海の日")
      ["2017-07-17", "2018-07-16", "2019-07-15"]

  """
  def date?(name) do
    generate_map_data()
    |> Enum.filter(fn {key, val} -> val == name end)
    |> Enum.map(fn {key, val} -> key end)
    |> Enum.sort
  end

  @doc """
  Generate Map data of Holidays in Japan.

  ## Examples

      iex> HolidaysEx.all
      [
         {"2017-01-01", "元日"},
         {"2017-01-02", "休日"},
         {"2017-01-09", "成人の日"}
         ...
      ]

  """
  def all() do
    generate_map_data() |> Enum.sort
  end

  defp generate_map_data() do
    CSV.decode!(File.stream!(Path.join(:code.priv_dir(:holidays_ex), "data.csv")), headers: false)
    |> Stream.drop(1)
    |> Stream.map( fn( [ date, name ] ) -> %{ date => name } end )
    |> Enum.flat_map( fn m -> Map.new(m) end )
    |> Map.new
  end
end
