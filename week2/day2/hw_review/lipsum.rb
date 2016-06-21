#!/usr/bin/env ruby

require 'erb'

lipsum_wanted = ARGV[0]
number = ARGV[1] || 1
number = number.to_i


if lipsum_wanted == "standard"
  paragraph = "srghehr erth rt hr6trdhj rtdy hyt (standard)"
elsif lipsum_wanted == "samuel"
  paragraph = "srghehr erth rt hr6trdhj rtdy hyt (samuel)"
else
  puts "Please pick standard or samuel"
  exit
end

this = "echo #{paragraph} | pbcopy"
puts this
system(this)
new_file = File.open("./#{lipsum_wanted}.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
