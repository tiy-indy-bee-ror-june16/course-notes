arr = %w(Indianapolis Carmel Greenwood Fishers Greenfield Zionsville)

shorties = []

arr.each do |i|
  shorties << i if i.length <= 7
end

puts shorties


others = arr.select do |i|
  i.length <= 7
end

puts "Select version"
puts others

longer_reject = []

arr.each do |i|
  if (i.length > 7) && (i[0] != "I") && (i[-1] != "s")
    longer_reject << i
  end
end

puts longer_reject

longies = arr.reject do |i|
  (i.length <= 7) || (i[0] == "I") || (i[-1] == "s")
end

puts "Long"
longies.each do |i|
  puts "City of #{i}"
end

if arr.include? "Indianapolis"
  puts "Indy"
end

i_cities = arr.select{|i| i.downcase.include?("i")}

puts i_cities

hashes = [
  {name: 'Chris', role: 'teacher', title: 'father', age: 37},
  {name: 'Pam', role: 'master of the house', title: 'mother', age: 23},
  {name: 'Benjamin', role: 'Nintendo player', title: 'kid', age: 7},
  {name: 'Lauren', role: 'Doll wrangler', title: 'kid', age: 5}
]

kids = []

hashes.each do |h|
  if h[:title] == 'kid'
    kids << h[:name]
  end
end

puts kids

kids = hashes.select{|k| k[:title] == 'kid'}.map{|i| i[:name]}

kid_names = []

hashes.each do |k|
  kid_names << k[:name]
end

puts kid_names

kids = hashes.collect{|k| k[:name] if k[:title] == 'kid'}.compact

puts kids.inspect

total_age = 0

hashes.each do |person|
  total_age += person[:age]
end

puts total_age

starter = 0

puts hashes.inject(starter){|sum, person| sum += person[:age]}

puts starter

hashes.each do |h|
  puts h.inspect
end

hashes[0].each do |pair|
  puts "<h1>#{pair[0]}</h1>"
  puts "<p>#{pair[1]}</p>"
end

def age_of_person(person_name, arr)
  arr.select{|pe| pe[:name] == person_name}.first[:age]
end

puts age_of_person("Chris", hashes)
puts age_of_person("Benjamin", hashes)

def person_of_age(age, arr=[])
  person = arr.detect{|pe| pe[:age] == age}
  person[:name] unless person.nil?
end

puts person_of_age(39, hashes)

def ages(collection: [], name: "Chris")
  collection.select{|s| s[:name] == name}.map{|p| p[:age]}
end

puts ages(name: "Benjamin", collection: hashes)

