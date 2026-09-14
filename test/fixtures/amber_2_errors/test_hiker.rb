require_relative 'hiker'
require 'minitest/autorun'

class TestHiker < Minitest::Test

  def test_life_the_universe_and_everything
    assert_equal 42, answer
  end

  def test_the_answer_is_two_digits_long
    assert_equal 2, answer.to_s.size
  end

end
