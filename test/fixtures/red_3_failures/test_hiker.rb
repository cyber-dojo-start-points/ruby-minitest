require_relative 'hiker'
require 'minitest/autorun'

class TestHiker < Minitest::Test

  def test_life_the_universe_and_everything
    assert_equal 42, answer
  end

  def test_the_answer_is_three_digits_long
    assert_equal 3, answer.to_s.size
  end

  def test_the_answer_is_the_question
    assert_equal '6 * 7', answer
  end

end
