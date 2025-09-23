defmodule P17 do
  @moduledoc false

  @ones %{
    1 => 3,
    2 => 3,
    3 => 5,
    4 => 4,
    5 => 4,
    6 => 3,
    7 => 5,
    8 => 5,
    9 => 4
  }

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

  @tens %{
    20 => 6,
    30 => 6,
    40 => 5,
    50 => 5,
    60 => 5,
    70 => 7,
    80 => 6,
    90 => 6
  }

  @hundred 7
  @and_ 3
  @thousand 8

  # simple rec
  def letters(1000), do: 3 + @thousand

  def letters(n) when n >= 100 do
    h = div(n, 100)
    r = rem(n, 100)
    base = @ones[h] + @hundred
    if r == 0, do: base, else: base + @and_ + letters(r)
  end

  def letters(n) when n >= 20 do
    t = div(n, 10) * 10
    r = rem(n, 10)
    if r == 0, do: @tens[t], else: @tens[t] + @ones[r]
  end

  def letters(n) when n >= 10, do: @teens[n]
  def letters(n) when n > 0, do: @ones[n]
  def letters(0), do: 0

  def solve_rec, do: rec_sum(1, 1000)
  defp rec_sum(i, max) when i > max, do: 0
  defp rec_sum(i, max), do: letters(i) + rec_sum(i + 1, max)

  # tail recursion solution
  def letters_tr(n), do: letters_tr(n, 0)
  defp letters_tr(0, acc), do: acc
  defp letters_tr(1000, acc), do: acc + 3 + @thousand

  defp letters_tr(n, acc) when n >= 100 do
    h = div(n, 100)
    r = rem(n, 100)
    acc = acc + @ones[h] + @hundred + if(r == 0, do: 0, else: @and_)

    letters_tr(r, acc)
  end

  defp letters_tr(n, acc) when n >= 20 do
    t = div(n, 10) * 10
    r = rem(n, 10)
    acc = acc + @tens[t] + if(r == 0, do: 0, else: @ones[r])

    letters_tr(0, acc)
  end

  defp letters_tr(n, acc) when n >= 10, do: letters_tr(0, acc + @teens[n])
  defp letters_tr(n, acc) when n > 0, do: letters_tr(0, acc + @ones[n])

  def solve_tail, do: do_tail(1, 1000, 0)
  defp do_tail(i, max, acc) when i > max, do: acc
  defp do_tail(i, max, acc), do: do_tail(i + 1, max, acc + letters_tr(i))

  def solve_map do
    Enum.map(0..999, fn x -> x + 1 end)
    |> Stream.filter(&(&1 >= 1))
    |> Stream.map(&letters_tr/1)
    |> Enum.sum()
  end

  def solve_for do
    for n <- 1..1000, reduce: 0 do
      acc -> acc + letters(n)
    end
  end

  def solve_inf_lazy do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.take(1000)
    |> Stream.map(&letters/1)
    |> Enum.sum()
  end
end
