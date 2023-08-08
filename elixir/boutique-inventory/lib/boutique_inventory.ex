defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price))
  end

  def with_missing_price(inventory) do
    inventory |> Enum.filter(fn x -> x.price == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(fn x -> %{ x | name: String.replace(x.name,
                                                    old_word, new_word) } end)
  end

  def increase_quantity(item, count) do
    %{item | quantity_by_size: Map.new(item.quantity_by_size,
                                       fn {k, v} -> {k, v + count} end)}
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn { _, v}, acc -> acc + v end)
  end
end
