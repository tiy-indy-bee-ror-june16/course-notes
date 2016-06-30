module AnimorphicActions

  def self.included(klass)
    klass.send(:attr_accessor, :feet_on_ground)
  end

  def self.extended(klass)
    klass.send(:eval, "def self.hey; 'Hey'; end;")
  end

  def move(feet=25)
    "I moved #{feet} feet"
  end

  def speak(phrase)
    system("say #{phrase}")
  end


end
