defmodule P17Test do
  use ExUnit.Case, async: true

  test "letter() counting" do
    assert P17.letters(342) == 23
    assert P17.letters(115) == 20
  end

  test "P17 recursion" do
    assert P17.solve_rec() == 21_124
  end

  test "P17 tail recursion" do
    assert P17.solve_tail() == 21_124
  end

  test "P17 module solution" do
    assert P17.solve_map() == 21_124
  end

  test "P17 for solution" do
    assert P17.solve_for() == 21_124
  end

  test "P17 infinite/lazy" do
    assert P17.solve_inf_lazy() == 21_124
  end
end
