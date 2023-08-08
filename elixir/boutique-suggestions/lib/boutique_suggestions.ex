defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    for t <- tops, b <- bottoms, combination_filter(t, b, options), do: {t, b}
  end

  defp combination_filter(x, y, options) do
    max_price = if Keyword.has_key?(options, :maximum_price) do
      Keyword.get(options, :maximum_price)
    else
      100
    end

    (x.price + y.price) <= max_price and (x.base_color != y.base_color)
  end
end
