module AnimalsHelper

  def set_background_for
    if @animal && (1..5).to_a.include?(@animal.id)
      "background#{@animal.id}"
    else
      "bg_default"
    end
  end

  def possessive(word)
    if word[-1] == s
      word + "'"
    else
      word + "'s"
    end
  end

end
