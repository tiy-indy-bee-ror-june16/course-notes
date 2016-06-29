class Die

  attr_accessor :sides

  def initialize
    @sides = (1..6).to_a
  end

  def roll
    sides.sample
  end

end
