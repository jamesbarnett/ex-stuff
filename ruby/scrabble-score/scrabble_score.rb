class Scrabble
  ScoreTable = {
    "AEIOULNRST" => 1,
    "DG" => 2,
    "BCMP" => 3,
    "FHVWY" => 4,
    "K" => 5,
    "JX" => 8,
    "QZ" => 10
  }

  def initialize(word)
    @word = word.upcase
  end

  def score
    reduce_chars {|c| score_letter c}
  end

  private

  def score_letter(c)
    ScoreTable.keys.each do |key|
      return ScoreTable[key] if key.include?(c)
    end

    0
  end

  def reduce_chars
    acc = 0
    @word.each_char do |c|
      acc += yield c
    end

    acc
  end
end
