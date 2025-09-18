defmodule Euler17 do
  @moduledoc """
  Problem 17 solution
  """

  @ones %{1 => 3, 2 => 3, 3 => 5, 4 => 4, 5 => 4, 6 => 3, 7 => 5, 8 => 5, 9 => 4}
  @teens %{
    10 => 3,
    11 => 6,
    12 => 6,
    13 => 8,
    14 => 8,
    15 => 7,
    16 => 7,
    17 => 9,
    18 => 8,
    19 => 8
  }
  @tens %{2 => 6, 3 => 6, 4 => 5, 5 => 5, 6 => 5, 7 => 7, 8 => 6, 9 => 6}
  @hundred 7
  @thousand 8
  @and_len 3

  def letters_len(1000), do: Map.fetch!(@ones, 1) + @thousand

  def letters_len(n) when n >= 100 do
    h = div(n, 100)
    r = rem(n, 100)
    base = Map.fetch!(@ones, h) + @hundred
    base + if r > 0, do: @and_len + letters_len(r), else: 0
  end

  def letters_len(n) when n >= 20 do
    t = div(n, 10)
    r = rem(n, 10)
    Map.fetch!(@tens, t) + if r > 0, do: Map.fetch!(@ones, r), else: 0
  end

  def letters_len(n) when n >= 10, do: Map.fetch!(@teens, n)
  def letters_len(n) when n >= 1, do: Map.fetch!(@ones, n)

  def total_1_to_1000 do
    1..1000 |> Enum.reduce(0, fn n, acc -> acc + letters_len(n) end)
  end
end
