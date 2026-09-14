# The name holds no "test", so cyber-dojo.sh never requires this file, and it
# is half written so it does not parse either. Vanishing is what it must not
# do: every .rb file is parsed, so this one is seen even though nothing runs
# it.
require_relative 'hiker'
require 'minitest/autorun'

class SpecHiker < Minitest::Test

  def test_the_answer_is_two_digits_long
    assert_equal 2, answer.to_s.size(
  end

end
