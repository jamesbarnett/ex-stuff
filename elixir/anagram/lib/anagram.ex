defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
     candidates
     |> Enum.filter(
          fn x -> anagram?(String.upcase(base),
                              String.upcase(x)) end)
  end
  
  defp anagram?(base, candidate) do
    base != candidate
      and sorted(base) == sorted(candidate) 
  end

  defp sorted(str) do
    str |> String.graphemes() |> Enum.sort()
  end
end
