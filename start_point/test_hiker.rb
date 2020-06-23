require_relative 'coverage'
require_relative 'hiker'
require 'minitest/autorun'

class TestHiker < MiniTest::Test

  def test_global_function
    assert_equal 42, global_answer
  end

  def test_instance_method
    assert_equal 42, Hiker.new.instance_answer
  end

end
