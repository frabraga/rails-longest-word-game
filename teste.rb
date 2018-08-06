require 'open-uri'
require 'json'
# letters = (0..10).map { (65 + rand(26)).chr }.join
# p letters.split("")

counter = Hash.new(0)
letters = ["u", "n", "n", "c", "p", "w", "p", "o", "i", "x", "u"]
    letters.each do |letter|
      counter[letter] += 1
    end

words = ["c", "u", "p"]


puts (words - letters).empty?

