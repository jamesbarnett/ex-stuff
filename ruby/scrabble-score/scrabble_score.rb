=begin
Write your code for the 'Scrabble Score' exercise in this file. Make the tests in
`scrabble_score_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/scrabble-score` directory.
=end
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
    @word = word 
  end

  def score
    points = 0
    @word.each_char do |c|
      points += score_letter(c.upcase)
    end
    points
  end

  def score_letter(c)
    ScoreTable.keys.each do |key|
      return ScoreTable[key] if key.include?(c)
    end

    0
  end
end
