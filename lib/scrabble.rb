class Scrabble
  attr_reader :word
  attr_accessor :total

  def initialize(word = nil)
    @word = word
    @total = 0
    @dbl_letter = []
    @dbl_word = []
  end

  def score(word = nil)
    if word == nil
    else
      word_split_for_each_letter = word.chars
      word_split_for_each_letter.each do |letter|
        @total += point_values[letter.upcase].to_i
      end
    end
    @total
  end

  def score_with_multipliers( word, dbl_letter, dbl_word = nil)
    multiple_letter = []
    @dbl_letter = dbl_letter
    if dbl_word == nil
      word_split_for_each_letter = word.chars
      word_split_for_each_letter.each do |letter|
        multiple_letter << point_values[letter.upcase].to_i
      end
      new_score = multiple_letter.zip(dbl_letter).map{|i,j| i*j }.inject(:+)
    else
      word_split_for_each_letter = word.chars
      word_split_for_each_letter.each do |letter|
        @total += point_values[letter.upcase].to_i
      end
      new_score = @total * 2
    end
    new_score
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end
end
