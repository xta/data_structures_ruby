require_relative '../stack.rb'

# Exercise: determine if input text is a balanced parentheses using Stack

class BalancedCheck

  attr_reader :input_string

  def initialize(input_string)
    @input_string = input_string
  end

  def balanced?
    stack = Stack.new
    balance = true

    input_string.split("").each_with_index do |character, index|
      if character == "("
        stack.push(character)
      else
        if stack.is_empty?
          balance = false
        else
          stack.pop
        end
      end
    end

    balance && stack.is_empty?
  end

end

not_balanced_1 = "(()"
not_balanced_2 = "))(()"
not_balanced_3 = ")("

puts "Checking not_balanced_1, 2, 3..."
puts BalancedCheck.new(not_balanced_1).balanced?
puts BalancedCheck.new(not_balanced_2).balanced?
puts BalancedCheck.new(not_balanced_3).balanced?

balanced_1 = "()()()"
balanced_2 = "(((()()())))"
balanced_3 = "()"

puts "Checking balanced_1, 2, 3..."
puts BalancedCheck.new(balanced_1).balanced?
puts BalancedCheck.new(balanced_2).balanced?
puts BalancedCheck.new(balanced_3).balanced?
