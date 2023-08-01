defmodule KitchenCalculator do
  defp unit_conversions(unit) do
    case unit do
      :milliliter -> 1
      :cup -> 240
      :fluid_ounce -> 30
      :teaspoon -> 5
      :tablespoon -> 15
    end
  end

  def get_volume({_unit, value}), do: value

  def to_milliliter({unit, value}) do
    {:milliliter, value * unit_conversions(unit)}
  end

  def from_milliliter({_unit, value}, unit),
    do: {unit, value / unit_conversions(unit)}

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
