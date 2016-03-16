require_relative '../binary_search.rb'

# note: collection is a randomized array of 1 to 1000
collection = (1..1000).to_a.shuffle

puts "Iterative binary search"

ibs = BinarySearch.new(collection)
puts "Does it contain 400?"
puts ibs.iterative_search?(400)

puts "Does it contain 1?"
puts ibs.search?(1)

puts "Does it contain 1000?"
puts ibs.search?(1000)

puts "Does it contain 9999?"
puts ibs.iterative_search?(9999)

puts


puts "Recursive binary search"
rbs = BinarySearch.new(collection)

puts "Does it contain 400?"
puts rbs.recursive_search?(400)

puts "Does it contain 1?"
puts rbs.recursive_search?(1)

puts "Does it contain 1000?"
puts rbs.recursive_search?(1000)

puts "Does it contain 4455?"
puts rbs.recursive_search?(4455)

puts
