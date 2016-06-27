require 'csv'

class Delivery

  attr_accessor :planet,
                :shipment,
                :money,
                :crates,
                :pilot

  def initialize(row)
    @planet = row["Destination"]
    @shipment = row["Shipment"]
    @money = row["Money"].to_i
    @crates = row["Crates"].to_i
    @pilot = pilot_map[planet]
  end

  def pilot_map
    pilots = {
      "Earth" => "Fry",
      "Mars" => "Amy",
      "Uranus" => "Bender"
    }
    pilots.default = "Leela"
    pilots
  end

  def bonus
    money * 0.1
  end

  def self.sum_of(deliveries, meth="money")
    deliveries.inject(0){|sum, delivery| sum += delivery.send(meth)}
  end


  # Delivery.total_revenue([...])
  def self.total_revenue(deliveries)
    sum_of(deliveries)
  end

  def self.deliveries_by_pilot(deliveries, pilot)
    deliveries.select{|delivery| delivery.pilot == pilot}
  end

  def self.bonus_by_pilot(deliveries, pilot)
    sum_of(deliveries_by_pilot(deliveries, pilot), "bonus")
  end

  def self.pilots_records(deliveries)
    deliveries.group_by{|x| x.pilot}
  end

  def self.planets_records(deliveries)
    deliveries.group_by{|x| x.planet}
  end
end

data = CSV.foreach('./planet_express_data.csv', headers: true).map do |x|
  Delivery.new(x)
end

puts "We earned $#{Delivery.total_revenue(data)} this week, dude"

Delivery.pilots_records(data).each do |pilot, deliveries|
  puts "#{pilot} made #{deliveries.length} deliveries and earned $#{Delivery.sum_of(deliveries, "bonus")}"
end

Delivery.planets_records(data).each do |planet, deliveries|
  puts "We made #{deliveries.length} trips to #{planet} and earned $#{Delivery.sum_of(deliveries)}"
end
