require_relative '../sequential_search.rb'

puts "Unordered Sequential Search"

puts "Collection: [1,2,3]"

ss = SequentialSearch.new([1,2,3])
puts "Contains 2?"
puts ss.search?(2)

puts "Contains 5?"
puts ss.search?(5)

puts


puts "Ordered Sequential Search"

puts "Collection: [33,99,22,11,101,44,23]"

oss = OrderedSequentialSearch.new([33,99,22,11,101,44,23])

puts "Contains 11?"
puts oss.search?(11)

puts "Contains 23?"
puts oss.search?(23)

puts "Contains 500?"
puts oss.search?(500)
