defmodule P17Test do
  use ExUnit.Case, async: true

  test "1..5 sum = 19" do
    sum = 1..5 |> Enum.map(&Euler17.letters_len/1) |> Enum.sum()
    assert sum == 19
  end

  test "342 = 23 (three hundred and forty-two)" do
    assert Euler17.letters_len(342) == 23
  end

  test "115 = 20 (one hundred and fifteen)" do
    assert Euler17.letters_len(115) == 20
  end

  test "1..1000 = 21124" do
    assert Euler17.total_1_to_1000() == 21_124
  end
end
