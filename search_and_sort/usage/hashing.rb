require_relative '../hashing.rb'

# output helper

def display_internal_state(h)
  p h.instance_variable_get(:@collection)
end

# Hashing usage

puts "# Simplistic Hash usage..."
puts

simple_hash = SimplisticHash.new

puts "Empty State of SimplisticHash:"
display_internal_state(simple_hash)
puts

elements = [54, 26, 93, 17, 77, 31]
puts "Add each element: #{elements}"

elements.each do |element|
  simple_hash.set(element)
end

display_internal_state(simple_hash)
puts "---------"
puts


puts "# Folding Hash usage..."
puts

folding_hash = FoldingHash.new

puts "Empty State of FoldingHash:"
display_internal_state(folding_hash)
puts

puts "Add 436-555-4601"
folding_hash.set("436-555-4601")
display_internal_state(folding_hash)
puts

puts "Add 421-555-989"
folding_hash.set("421-555-989")
display_internal_state(folding_hash)
puts "---------"
puts


puts "# Mid Square Hash usage..."
puts

mid_square_hash = MidSquareHash.new

puts "Empty State of MidSquareHash:"
display_internal_state(mid_square_hash)
puts

elements = [54, 26, 93, 17, 77, 31]
puts "Add each element: #{elements}"

elements.each do |element|
  mid_square_hash.set(element)
end

display_internal_state(mid_square_hash)
puts "---------"
puts


puts "# Character Ordinal Hash usage..."
puts

ordinal_hash = CharacterOrdinalHash.new

puts "Add: cat"
ordinal_hash.set("cat")

display_internal_state(ordinal_hash)
puts "---------"
puts
