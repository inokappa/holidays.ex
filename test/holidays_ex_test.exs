defmodule HolidaysExTest do
  use ExUnit.Case
  doctest HolidaysEx, except: [:moduledoc, all: 0,
                                           dates: 0,
                                           to_json: 0
                              ]

  import Mock

  setup_all do
    {:ok, days: ["2017-07-17", "2018-07-16", "2019-07-15"],
          holiday: "元日"
    }
  end

  test "Return Umino-Hi's dates", state do
    with_mock HolidaysEx,
      [when?: fn("海の日") -> state[:days] end] do
      assert HolidaysEx.when?("海の日") == state[:days]
    end
  end

  test "Return All Holidays(date only)", state do
    with_mock HolidaysEx,
      [dates: fn() -> state[:days] end] do
      assert HolidaysEx.dates() == state[:days]
    end
  end

  test "Return holiday's name by date", state do
    with_mock HolidaysEx,
      [holiday?: fn("2018-01-01") -> state[:holiday] end] do
      assert HolidaysEx.holiday?("2018-01-01") == state[:holiday]
    end
  end
end
