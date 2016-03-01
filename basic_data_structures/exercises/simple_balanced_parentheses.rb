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
    valid_balance_openers = ["(", "[", "{"]

    input_string.split("").each_with_index do |character, index|
      if valid_balance_openers.include? character
        stack.push(character)
      else
        if stack.is_empty?
          balance = false
        else
          popped = stack.pop
          balance = false if !symbols_match(popped, character)
        end
      end
    end

    balance && stack.is_empty?
  end

  private

  def symbols_match(open_symbol, close_symbol)
    opens = "([{"
    closes = ")]}"
    opens.index(open_symbol) == closes.index(close_symbol)
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

puts "Going above and beyond, check with other symbols: [] {}..."

puts "Checking not_balanced_4, 5, 6..."

not_balanced_4 = "[[((()]))"
not_balanced_5 = "[{()]"
not_balanced_6 = "([)]"

puts BalancedCheck.new(not_balanced_4).balanced?
puts BalancedCheck.new(not_balanced_5).balanced?
puts BalancedCheck.new(not_balanced_6).balanced?

puts "Checking balanced_4, 5, 6..."

balanced_4 = "[[{{(())}}]]"
balanced_5 = "{{([][])}()}"
balanced_6 = "[][][](){}"

puts BalancedCheck.new(balanced_4).balanced?
puts BalancedCheck.new(balanced_5).balanced?
puts BalancedCheck.new(balanced_6).balanced?
