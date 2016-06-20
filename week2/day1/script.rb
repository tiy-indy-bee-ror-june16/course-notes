require 'erb'

my_variable = ARGV.first

other = ARGV[1]
other ||= 1
other = other.to_i
puts other.inspect

#puts ARGV.inspect

#case my_variable
#when "hey"
  #title = "Howdy ya'll"
  #content = "This is the hey one"
  #name = "Billy"
#when "hi"
  #title = "Hi yinz"
  #content = "This is the hi one"
  #puts name
#else
  #title = my_variable
  #content = "This is the #{my_variable} one"
  #name = my_variable
#end

#if (my_variable == nil) || my_variable == "unknown"
  #title = "There's something here"
  #content = "It could be anything"
  #name = "Unknown"
  #my_variable = "unknown"
#elsif my_variable == "hey" # A comment
  #title = "Howdy ya'll"
  #content = "This is the hey one"
  #name = "Billy"
#elsif my_variable == "hi"
  #title = "Hi yinz"
  #content = "This is the hi one"
#else
  #puts "Hi from else!"
  #title = my_variable
  #content = "This is the #{my_variable} one"
  #name = my_variable
#end

tester = true

case my_variable
when (nil || "unknown")
  title = "There's something here"
  content = "It could be anything"
  name = "Unknown"
  my_variable = "unknown"
when "hey" # A comment
  title = "Howdy ya'll"
  content = "This is the hey one"
  name = "Billy"
when "hi"
  title = "Hi yinz"
  content = "This is the hi one"
else
  puts "Hi from else!"
  title = my_variable
  content = "This is the #{my_variable} one"
  name = my_variable
end


new_file = File.open("#{my_variable.to_s.downcase}.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
