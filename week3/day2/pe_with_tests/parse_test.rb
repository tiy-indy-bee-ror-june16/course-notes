require 'minitest/autorun'
require './parse'

class ParseTest < MiniTest::Test

  def setup
    Delivery.deliveries.clear
  end

  def test_parse_data_makes_deliveries
    Parse.parse_data('./test_data.csv')
    assert 10, Delivery.deliveries.length
    assert_equal 10, Parse.deliveries.length
  end

  def test_instance_deliveries
    parse = Parse.new
    parse.deliver_me
    assert_equal 1, Delivery.deliveries.length
  end

end
