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

class Factory

  def self.build_robots(names)
    names.map{ |name| Robot.new(name) }
  end

end

class String

  def piglatinify
    self.split.map do |word|
      word[1..-1] + word[0] + "ay"
    end.join(" ")
  end

  def reverse
    self
  end

end

"banana".piglatinify

class Piglatinify

  def self.change_this(string)
    string.split.map do |word|
      word[1..-1] + word[0] + "ay"
    end.join(" ")
  end

end

Piglatinify.change_this("banana")

robots = Factory.build_robots(our_class)

robots.each do |robot|
  puts robot.say_name
end

robot = Robot.new("Charles")
puts robot.name
puts robot.say_name
bender = BendingUnit.new("Bender")
puts bender.name
puts bender.bend("pipe")
calculon = ActorUnit.new("Calculon")
calculon.change_name("Charlene")
puts calculon.say_name
