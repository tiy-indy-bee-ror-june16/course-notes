require 'minitest/autorun'

class SimpleTest < MiniTest::Test

  def test_the_truth
    refute true == false, "Cats and dogs living together. Mass hysteria"
  end

  def test_divide_by_integer
    assert_equal 5, 10/2
    refute_equal 5.5, 11/2
    assert_equal 6, 59/10
  end

  def test_divide_by_float
    assert_equal 5.5, 11/2.0
    assert_equal 5, 10/2.0
    assert 5 == 5.0
  end

end
