require './animorphic_actions'

class Human
  extend AnimorphicActions
  include AnimorphicActions

  attr_accessor :name, :height, :weight

  def initialize(name, height, weight)
    @name = name
    @height = height
    @weight = weight
  end

  def hike_this
    hike
  end

  def walk_him(human)
    human.walk
  end

  def say_hello_to(human)
    "Howdy, #{human.greeting}!"
  end

  protected

  def greeting
    " you filthy sob, #{name}"
  end

  def walk
    "Walk!"
  end

  private

  def hike
    "Hike!"
  end

end
