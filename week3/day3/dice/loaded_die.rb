require './die'

class LoadedDie < Die

  def initialize
    self.sides = (1..6).to_a + 20.times.map{6}
  end

end
