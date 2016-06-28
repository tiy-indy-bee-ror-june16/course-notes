require 'minitest/autorun'
require './delivery'

class DeliveryTest < MiniTest::Test

  def test_delivery_atrributes
    row = {
      "Destination" => "Earth",
      "Shipment" => "Fruit",
      "Crates" => "23",
      "Money" => "5000"
    }
    delivery = Delivery.new(row)
    assert delivery.money.is_a?(Fixnum), delivery.money.class
    assert delivery.crates.is_a?(Fixnum)
    assert delivery.pilot == "Fry"
  end

  def test_amy_pilot
    delivery = Delivery.new({"Destination" => "Mars"})
    assert delivery.pilot == "Amy"
  end

  def test_bender_pilot
    delivery = Delivery.new({"Destination" => "Uranus"})
    assert delivery.pilot == "Bender"
  end

  def test_leela_pilot
    delivery = Delivery.new({"Destination" => "Saturn"})
    assert delivery.pilot == "Leela"
  end

  def test_deliveries_holder
    Delivery.deliveries.clear
    4.times { Delivery.new({"Destination" => "Saturn"}) }
    assert 4 == Delivery.deliveries.length, Delivery.deliveries.inspect
    assert "Leela" == Delivery.deliveries.first.pilot
  end

  def test_deliveries_by_pilot
    Delivery.deliveries.clear
    Delivery.new({"Destination" => "Mars"})
    Delivery.new({"Destination" => "Mars"})
    Delivery.new({"Destination" => "Earth"})
    Delivery.new({"Destination" => "Saturn"})
    assert Delivery.deliveries_by("Fry").length == 1
    assert Delivery.deliveries_by("Amy").length == 2
  end

  def test_bonus
    delivery = Delivery.new({"Money" => "5555"})
    assert_equal 555.5, delivery.bonus
  end



end
