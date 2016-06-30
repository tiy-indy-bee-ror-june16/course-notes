require './animorphic_actions'
class Dog

  include AnimorphicActions

  attr_accessor :name, :breed

  def initialize(name, breed)
    @name = name
    @breed = breed
  end

end
