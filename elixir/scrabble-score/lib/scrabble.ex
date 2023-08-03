defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(""), do: 0
  def score(word) do
    word
    |> String.split("") |> Enum.filter(&(&1 != ""))
    |> Enum.reduce(fn c -> score_letter(c) end) 
  end

  def score_letter(c) do
    cond do
      c in ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] -> 1
      c in ['D', 'G'] -> 2
      c in ['B', 'C', 'M', 'P'] -> 3
      c in ['F', 'H', 'V', 'W', 'Y'] -> 4
      c in ['K'] -> 5
      c in ['J', 'X'] -> 6
      c in ['Q', 'Z'] -> 7
      true -> 0
    end
  end
end
