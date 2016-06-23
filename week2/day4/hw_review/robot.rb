class Robot

  attr_accessor :name, :height

  # name
  # name=(arg)

  def initialize(name, height=10)
    @name = name
    @height = height
  end

  def say_hi
    "Hi"
  end

  def say_name
    "My name is #{name}"
  end

  def name
    "Robot Overlord #{@name}"
  end

  def method_missing(method, *args)
    "#{method} does not compute"
  end

end

class BendingUnit < Robot

  def bend(object_to_bend)
    "Bend #{object_to_bend}!"
  end

  def method_missing(method, *args)
    if method.to_s.include? "bend_"
      bend(method.to_s.gsub("bend_", ""))
    else
      super(method, args)
    end
  end


end

class ActorUnit < Robot

  def change_name(new_name)
    self.name=(new_name)
  end

end

our_class = %w(Isaiah Sean Marie Danny)

robots = our_class.map{ |student| Robot.new(student) }


robot = Robot.new("Charles")
puts robot.name
puts robot.say_name
bender = BendingUnit.new("Bender")
puts bender.name
puts bender.bend("pipe")
calculon = ActorUnit.new("Calculon")
calculon.change_name("Charlene")
puts calculon.say_name
