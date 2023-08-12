require Logger
defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    color_count |> :math.log2() |> :math.ceil() |> Kernel.trunc
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0b00::2,0b01::2,0b10::2,0b11::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _color_count), do: nil
  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<pixel::size(bit_size), _rest::bitstring>> = picture
    pixel
  end

  def drop_first_pixel(<<>>, _color_count), do: <<>>
  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<_dropped::size(bit_size), kept::bitstring>> = picture
    kept
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
