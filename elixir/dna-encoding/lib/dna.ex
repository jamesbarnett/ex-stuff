defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?A -> 1 # <<0b0001::4>>
      ?C -> 2 # <<0b0010::4>>
      ?G -> 4 # <<0b0100::4>>
      ?T -> 8 # <<0b1000::4>>
      ?\s -> 0 # <<0b0000::4>>
    end
  end

  # def encode([]) do nil end
  defp encode(dna, acc) when is_list(dna) do
    case dna do 
      [] -> <<>>
      [h|t] -> <<encode_nucleotide(h)::size(4), encode(t, acc)::bitstring>>
    end
  end

  def encode(dna) do
    encode(dna, <<>>)
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def decode(dna) do
    decode(dna, [])
  end

  defp decode(dna, acc) do
    case dna do
      <<>> -> []
      <<h::4, t::bitstring>> -> [decode_nucleotide(h)] ++ decode(t, acc)
    end
  end
end
