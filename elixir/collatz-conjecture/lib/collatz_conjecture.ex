require Logger

defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input > 0 and is_integer(input) do
    calc_rec(input, 1)
  end

  # @spec calc_rec(input :: pos_integer() :: step :: non_neg_integer()) :: non_neg_integer()
  defp calc_rec(1, _), do: 0
  # defp calc_rec(2, step), do: 1 + step
  defp calc_rec(input, step) do
    new_input = if rem(input, 2) == 0 do
      div(input, 2)
    else
      (3 * input) + 1
    end
    if new_input == 1 do
      step
    else
      calc_rec(new_input, step + 1)
    end
  end
end

