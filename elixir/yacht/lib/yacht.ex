defmodule Yacht do
  @type category ::
          :ones
          | :twos
          | :threes
          | :fours
          | :fives
          | :sixes
          | :full_house
          | :four_of_a_kind
          | :little_straight
          | :big_straight
          | :choice
          | :yacht

  @doc """
  Calculate the score of 5 dice using the given category's scoring method.
  """
  @spec score(category :: category(), dice :: [integer]) :: integer
  def score(category, dice) do
    case category do
      :ones -> score_n(dice, 1)
      :twos -> score_n(dice, 2)
      :threes -> score_n(dice, 3)
      :fours -> score_n(dice, 4)
      :fives -> score_n(dice, 5)
      :sixes -> score_n(dice, 6)
      :full_house -> score_full_house(dice)
      :four_of_a_kind -> score_four_of_a_kind(dice)
      :little_straight -> score_little_straight(dice)
      :big_straight -> score_big_straight(dice)
      :choice -> score_choice(dice)
      :yacht -> score_yacht(dice)
      _ -> 0 
    end
  end

  defp score_n(dice, n) do
    List.foldl(dice, 0, (fn x, acc -> if x == n do acc + n else acc end end))
  end

  defp score_yacht(dice) do
    if Enum.all?(dice, (fn x -> x == Enum.fetch!(dice, 0) end)) do
      50
    else
      0
    end
  end

  defp score_full_house(dice) do
    case (Enum.sort(dice)) do
      [x, x, x, y, y]
        -> 
          if x != y do
            List.foldl(dice, 0, (fn n, acc -> acc + n end))
          else
            0
          end
      [x, x, y, y, y] 
        -> 
          if x != y do
            List.foldl(dice, 0, (fn n, acc -> acc + n end))
          else
            0
          end
      _ -> 0 
    end
  end

  defp score_four_of_a_kind(dice) do
    case (Enum.sort(dice)) do 
      [x, x, x, x, _] -> 4 * x
      [_, x, x, x, x] -> 4 * x
      _ -> 0
    end
  end

  defp score_little_straight(dice) do
    if Enum.sort(dice) == [1, 2, 3, 4, 5] do
      30
    else
      0
    end
  end

  defp score_big_straight(dice) do
    if Enum.sort(dice) == [2, 3, 4, 5, 6] do
      30
    else
      0
    end
  end

  defp score_choice(dice) do
    List.foldl(dice, 0, fn x, acc -> acc + x end)
  end
end
