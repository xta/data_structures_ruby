require_relative '../stack.rb'

# Exercise: convert a number to binary representation

class Converter

  def initialize(input_number)
    @input_number = input_number
  end

  def to_binary
    stack = Stack.new

    while @input_number > 0
      remainder = @input_number % 2
      stack.push(remainder)
      @input_number = @input_number/2
    end

    stack.collection.reduce("") {|memo, char| memo = String(char) + memo}
  end

end

expected = "101010"
puts "Checking 42..."
binary_42 = Converter.new(42).to_binary
puts "Got #{binary_42}"
puts "Success? #{expected == binary_42}"

puts

expected = "1100100"
puts "Checking 100..."
binary_100 = Converter.new(100).to_binary
puts "Got #{binary_100}"
puts "Success? #{expected == binary_100}"
