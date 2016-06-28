require 'csv'
require './delivery'

class Parse

  def self.deliveries
    Delivery.deliveries
  end

  def self.parse_data(csv)
    CSV.foreach(csv, headers: true).map{|d| Delivery.new(d)}
  end

  def deliver_me
    Delivery.new({"Destination" => "Mercury"})
  end

  def first_delivery
    self.class.deliveries.first
  end



end
