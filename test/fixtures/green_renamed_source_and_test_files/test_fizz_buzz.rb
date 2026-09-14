require_relative 'fizz_buzz'
require 'minitest/autorun'

class TestFizzBuzz < Minitest::Test

  def test_life_the_universe_and_everything
    assert_equal 42, fizz_buzz
  end

end
