defmodule P13Test do
  use ExUnit.Case, async: true

  @expected "5537376230"

  test "P13 test all variants" do
    variants = [
      &Euler13.first10_enum/0,
      &Euler13.first10_tail/0,
      &Euler13.first10_rec/0,
      &Euler13.first10_stream/0
    ]

    Enum.each(variants, fn fun ->
      assert fun.() == @expected
    end)
  end
end
