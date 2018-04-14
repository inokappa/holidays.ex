defmodule HolidaysExTest do
  use ExUnit.Case
  doctest HolidaysEx, except: [:moduledoc, all: 0, to_json: 0]

  setup_all do
    {:ok, days: ["2017-07-17", "2018-07-16", "2019-07-15"], holiday: "元日"}
  end

  test "Get Umino-Hi's dates", state do
    assert HolidaysEx.when?("海の日") == state[:days]
  end

  test "Get holiday's name by date", state do
    assert HolidaysEx.holiday?("2018-01-01") == state[:holiday]
  end
end
