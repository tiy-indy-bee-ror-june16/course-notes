class Person

  attr_accessor :name, :height, :age, :eye_color, :hair_color

  def initialize(name, options_hash={})
    unless options_hash[:age] && options_hash[:height]
      raise ArgumentError
    end
    @name = name
    @age = options_hash[:age] || 23
    @height = options_hash[:height]
  end

  #attr_reader :name
  #attr_writer :name

  #def name
    #@name
  #end

  #def name=(new_name)
    #@name = new_name
  #end

  def name
    "Lord Admiral #{@name}"
  end

  def canadian_height
    self.height = 12
  end

  def speak(phrase)
    system("say #{phrase.split(//).shuffle.join}")
  end


end

class Kid < Person

  def name
    "Vice Admiral #{@name}"
  end

  def inspect
    name
  end

end

class Baby < Kid

  attr_accessor :feedings_per_day, :diapers_per_day

end

class Movie

  attr_accessor :title, :budget, :stars, :baby

  def initialize(hash)
    @title = hash[:title]
    @budget = hash[:budget]
    @stars = hash[:stars]
    @baby = Baby.new("George", age: 0.5, height: 23)
  end

  def starring?(actor)
    stars.include? actor
  end

end

