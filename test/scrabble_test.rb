gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def test_that_scrabble_exists
    game = Scrabble.new

    assert_instance_of Scrabble, game
  end

  def test_that_scrabble_takes_a_letter
    game = Scrabble.new('a')

    assert_equal "a", game.word
  end

  def test_that_word_can_be_empty
    game = Scrabble.new

    assert_equal nil, game.word
  end

  def test_it_can_score_a_single_letter

    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_uppercase_letter

    assert_equal 1, Scrabble.new.score("A")
  end

  def test_it_can_score_a_two_letter_word
    assert_equal 5, Scrabble.new.score("hi")
  end

  def test_it_can_score_a_5_letter_word
    game = Scrabble.new
    assert_equal 8, game.score("hello")
  end

  def test_it_can_score_a_word__blank_
    game = Scrabble.new("")
    assert_equal 0, game.score
  end

  def test_it_can_score_a_word_is_nil
    game = Scrabble.new
    assert_equal 0, game.score
  end

  def test_score_with_multipliers_dbls_score
    game = Scrabble.new
    multiplied_score = game.score_with_multipliers('hello', [1,2,1,1,1])

    assert_equal 9 , multiplied_score
  end

  def test_score_with_multipliers_dbls_word
    game = Scrabble.new
    multiplied_score = game.score_with_multipliers('hello', [1,2,1,1,1], 2)

    assert_equal 18 , multiplied_score
  end

end
