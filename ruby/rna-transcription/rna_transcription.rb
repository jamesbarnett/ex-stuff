class Complement
  DnaRnaMap = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }

  def self.of_dna(seq)
    result = ''
    seq.each_char do |c|
      result += DnaRnaMap[c]
    end
    result
  end
end
