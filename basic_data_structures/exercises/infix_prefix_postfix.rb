require_relative '../stack.rb'

# Exercise: convert between infix, prefix, and postfix
## Infix:   x * y
## Prefix:  * x y
## Postfix: x y *

class Converter

  Precedence = {
    "*" => 3,
    "/" => 3,
    "+" => 2,
    "-" => 2,
    "(" => 1,
  }.freeze

  Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("").freeze
  Numeric = "0123456789".split("").freeze

  attr_reader :math_expression

  def initialize(math_expression)
    @math_expression = math_expression
  end

  # note: using while loop with `symbols` Stack, since Stack does not support enumerable methods

  def infix_to_postfix
    symbols = Stack.new
    output = []
    tokens = math_expression.split(" ")

    tokens.each do |token|
      if Alphabet.include? token or Numeric.include? token
        output.push token
      elsif token == "("
        symbols.push(token)
      elsif token == ")"
        move_operators_to_output(symbols, output)
      else
        # token is an operator symbol (+-*/)
        handle_operator(token, symbols, output)
      end
    end

    while !symbols.is_empty?
      output.push(symbols.pop)
    end

    output.join(" ")
  end

  private

  def move_operators_to_output(symbols, output)
    top_token = symbols.pop

    while top_token != "("
      output.push(top_token)
      top_token = symbols.pop
    end
  end

  def handle_operator(token, symbols, output)
    while !symbols.is_empty? and Precedence[symbols.peek] >= Precedence[token]
      output.push(symbols.pop)
    end
    symbols.push(token)
  end

end

infix_1 = "( A + B ) * ( C + D )"
puts "Converting: #{infix_1}"
infix_1_result = Converter.new(infix_1).infix_to_postfix
puts infix_1_result
puts "Success? #{"A B + C D + *" == infix_1_result}"
puts

infix_2 = "( A + B ) * C"
puts "Converting: #{infix_2}"
infix_2_result = Converter.new(infix_2).infix_to_postfix
puts infix_2_result
puts "Success? #{"A B + C *" == infix_2_result}"
puts

infix_3 = "A + B * C"
puts "Converting: #{infix_3}"
infix_3_result = Converter.new(infix_3).infix_to_postfix
puts infix_3_result
puts "Success? #{"A B C * +" == infix_3_result}"
puts
