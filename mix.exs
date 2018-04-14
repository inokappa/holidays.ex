defmodule HolidaysEx.MixProject do
  use Mix.Project

  @description """
    This library deals with Japanese holiday information.
    内閣府が提供する祝日の csv データ (http://www8.cao.go.jp/chosei/shukujitsu/syukujitsu_kyujitsu.csv) を利用しています.
  """

  def project do
    [
      app: :holidays_ex,
      version: "0.0.4",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "holidays_ex",
      description: @description,
      package: [
        maintainers: ["Yohei Kawahara"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/inokappa/holidays.ex"},
        files: ["lib", "test", "mix.exs", "README*", "priv*"],
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:csv, "~> 2.0.0"},
      {:poison, "~> 3.1"},
      {:ex_doc, "~> 0.14", only: :dev}
    ]
  end
end
