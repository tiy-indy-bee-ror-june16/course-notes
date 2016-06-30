module AnimorphicActions

  def feet_on_ground
    @feet_on_ground
  end

  def feet_on_ground=(num)
    @feet_on_ground = num
  end

  def move(feet=25)
    "I moved #{feet} feet"
  end

  def speak(phrase)
    system("say #{phrase}")
  end


end
