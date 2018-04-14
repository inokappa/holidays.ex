# holidays.ex

去年, 今年, 来年の祝日情報を返すライブラリです. 内閣府が提供する祝日の csv データ (http://www8.cao.go.jp/chosei/shukujitsu/syukujitsu_kyujitsu.csv) を利用しています.

## Install

* mix.exs

```ruby
defp deps do
  [
    {:holidays_ex, "~> 0.0.4"},
  ]
end
```

* Run mix deps.get

```sh
mix deps.get
```

## Functions

### to_json()

```ruby
iex> HolidaysEx.to_json
"{\"2019-11-03\":\"文化の日\",\"2018-09-23\":\"秋分の日\"..."
```

### holiday?()

```ruby
iex> HolidaysEx.holiday?("2019-11-03")
"文化の日"
```

### when?()

```ruby
iex> HolidaysEx.when?("海の日")
["2017-07-17", "2018-07-16", "2019-07-15"]
```

### all()

```ruby
iex> HolidaysEx.all
[
   {"2017-01-01", "元日"},
   {"2017-01-02", "休日"},
   {"2017-01-09", "成人の日"}
   ...
]
```
