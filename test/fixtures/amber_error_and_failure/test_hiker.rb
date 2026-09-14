require_relative 'hiker'
require 'minitest/autorun'

class TestHiker < Minitest::Test

  def test_life_the_universe_and_everything
    assert_equal 42, answer
  end

  def test_the_checksum_of_the_answer
    assert_equal 7, checksum
  end

end
