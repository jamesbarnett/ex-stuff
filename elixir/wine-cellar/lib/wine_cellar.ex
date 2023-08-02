defmodule WineCellar do
  def explain_colors do
    [white: "Fermented without skin contact.",
     red: "Fermented with skin contact using dark-colored grapes.",
     rose: "Fermented with some skin contact, but not enough to qualify as a red wine."]
  end

  def filter(cellar, color, opts \\ []) do
    Keyword.get_values(cellar, color)
    |> by_year_if_present(opts)
    |> by_country_if_present(opts)
  end

  defp by_year_if_present(cellar, opts) do
    if Keyword.has_key?(opts, :year) do
      filter_by_year(cellar, Keyword.fetch!(opts, :year))
    else
      cellar
    end
  end

  defp by_country_if_present(cellar, opts) do
    if Keyword.has_key?(opts, :country) do
      filter_by_country(cellar, Keyword.fetch!(opts, :country))
    else
      cellar
    end
  end

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
