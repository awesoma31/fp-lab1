defmodule P17Test do
  use ExUnit.Case, async: true

  test "sample 1..5 sum = 19" do
    sum = 1..5 |> Enum.map(&Euler17.letters_len/1) |> Enum.sum()
    assert sum == 19
  end

  test "342 has 23 letters (three hundred and forty-two)" do
    assert Euler17.letters_len(342) == 23
  end

  test "115 has 20 letters (one hundred and fifteen)" do
    assert Euler17.letters_len(115) == 20
  end

  test "final answer 1..1000 = 21124" do
    assert Euler17.total_1_to_1000() == 21124
  end
end
