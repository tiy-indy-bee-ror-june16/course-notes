our_class = ["Isaiah", "Sean", "Marie", "Danny"]

four_names = []

our_class.each do |name|
  four_names << name if name.length < 5
end

four_names

four_names = our_class.select{|name| name.length < 5}

sentence = "Ruby is kind of fun once you get used to it"

four_words = sentence.split.select{|word| word.length == 4}

movies = []
movies << {
  title: "Forest Gump",
  budget: 55,
  stars: ["Tom Hanks"]
}
movies << {
  title: "Star Wars",
  budget: 11,
  stars: ["Mark Hamill", "Harrison Ford"]
}
movies << {
  title: "Batman Begins",
  budget: 150,
  stars: ["Christian Bale", "Liam Neeson", "Michael Caine"]
}
movies << {
  title: "Titanic",
  budget: 200,
  stars: ["Kate Winslet", "Leonardo DiCaprio"]
}
movies << {
  title: "Inception",
  budget: 160,
  stars: ["Leonardo DiCaprio", "JGL"]
}

cheap_movies = movies.select{|film| film[:budget] < 100}.map{|x| x[:title]}

cheap_movies = []

movies.each do |movie|
  cheap_movies << movie[:title] if movie[:budget] < 100
end

cheap_movies

leo_movies = []

movies.each do |p|
  leo_movies << p[:title] if p[:stars].include? "Leonardo DiCaprio"
end

leo_movies

leo_movies = movies.select{|film| film[:stars].include? "Leonardo DiCaprio"}.map{|x| x[:title]}


def how_many_words(text, num=4)
  text.split.select{|word| word.length == num}
end

def four_words(text)
  how_many_words(text)
end

total = 0

movies.each do |w|
  total += w[:budget]
end

total

total = movies.inject(0){|sum, w| sum += w[:budget]}

total = movies.map{|x| x[:budget]}.inject(:+)

movies.inject({}){|hash, x| hash[x[:title]] = x[:budget]}

# {"Titanic" => 200, "Star Wars" => 20 ...}

movie_stars = movies.map{|x| x[:stars]}

movie_stars.flatten.uniq.map do |actor|
  {
    star: actor,
    movies: movies.select{|d| d[:stars].include? actor}.map{|f| f[:title]}
  }
end

# [[..], [..], [..]]









