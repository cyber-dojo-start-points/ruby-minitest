require_relative 'hiker'
require 'minitest/autorun'

class TestAnswerSize < Minitest::Test

  def test_the_answer_is_two_digits_long
    assert_equal 2, answer.to_s.size
  end

  def test_the_answer_is_three_digits_long
    assert_equal 3, answer.to_s.size
  end

end
