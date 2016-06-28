class Delivery

  def self.pilots
    unless defined?(@pilots)
      @pilots = {
        "Earth" => "Fry",
        "Mars" => "Amy",
        "Uranus" => "Bender"
      }
      @pilots.default = "Leela"
    end
    @pilots
  end

  def self.deliveries
    unless defined?(@deliveries)
      @deliveries = []
    end
    @deliveries
  end

  def self.deliveries_by(this_pilot)
    deliveries.select{|x| x.pilot == this_pilot}
  end

  attr_accessor :money, :planet, :shipment, :crates, :pilot

  def initialize(row)
    @money = row["Money"].to_i
    @crates = row["Crates"].to_i
    @planet = row["Destination"]
    @shipment = row["Shipment"]
    @pilot = self.class.pilots[planet]
    self.class.deliveries << self
  end

end
