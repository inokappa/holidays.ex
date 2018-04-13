defmodule HolidaysExTest do
  use ExUnit.Case
  doctest HolidaysEx, except: [:moduledoc, all: 0, to_json: 0]

  setup_all do
    {:ok, days: ["2017-07-17", "2018-07-16", "2019-07-15"]}
  end

  test "Get Umino-Hi's dates", state do
    assert HolidaysEx.date?("海の日") == state[:days]
  end

  test "Get holiday's name by date" do
    assert HolidaysEx.name?("2018-01-01") == "元日"
  end
end
