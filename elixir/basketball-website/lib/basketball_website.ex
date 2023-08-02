defmodule BasketballWebsite do
  def extract_from_path(data, path) when is_bitstring(path) do
    [head | tail] = String.split(path, ".")
    extract_from_path(data[head], tail)
  end

  def extract_from_path(data, [head | tail] = path) when is_list(path) do
    extract_from_path(data[head], tail)
  end

  def extract_from_path(data, []), do: data

  def get_in_path(data, path) do
    keys = String.split(path, ".")
    Kernel.get_in(data, keys)
  end
end
