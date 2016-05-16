require_relative '../binary_tree.rb'
require_relative '../../basic_data_structures/stack.rb'

# Exercise: use a parse tree to solve a math problem.
# Parse trees can be used to represent sentences of math expressions.

# For example, (7 + 3) * (5 - 2) can be represented in the following tree:

#         *
#       /   \
#     +       -
#    / \     / \
#   7   3   5   2

# Four tokens to consider when parsing: left parentheses, right parentheses, operators, operands

module StringIntChecker
  refine String do
    def is_integer?
      self.to_i.to_s == self
    end
  end
end

class ParseMathTree

  using StringIntChecker

  def initialize(math_expression)
    @tokens = find_tokens(math_expression)
  end

  def parse
    stack = Stack.new
    @root_node = Node.new('')

    stack.push(@root_node)
    current_node = @root_node

    @tokens.each do |token|
      if token == "("
        current_node.add_left('')
        stack.push(current_node)
        current_node = current_node.left_node

      elsif !%w[+ - * / )].include?(token)
        current_node.value = Integer(token)
        parent = stack.pop
        current_node = parent

      elsif %w[+ - * /].include?(token)
        current_node.value = token
        current_node.add_right('')
        stack.push(current_node)
        current_node = current_node.right_node

      elsif token == ")"
        current_node = stack.pop

      end
    end
  end

  def solve
    # naively assume @root_node was already set by calling parse
    evaluate(@root_node)
  end

  private

  def evaluate(node)
    left = node.left_node
    right = node.right_node

    if left && right
      operation = node.value
      evaluate(left).send(operation, evaluate(right))
    else
      node.value
    end
  end

  def find_tokens(math_expression)
    tokens = []
    math_expression.delete(" ").chars.each do |char|
      if tokens.any? && tokens.last.is_integer? && char.is_integer?
        tokens[tokens.size-1] += char
      else
        tokens.push(char)
      end
    end
    tokens
  end

end

math_equation = "((10+5) *3)"
puts "Use Parse Tree to parse & solve #{math_equation}"

pmt = ParseMathTree.new(math_equation)
pmt.parse
puts pmt.solve
puts


math_equation_2 = "((7 + 3) * (5 - 2))"
puts "Use Parse Tree to parse & solve #{math_equation_2}"

pmt = ParseMathTree.new(math_equation_2)
pmt.parse
puts pmt.solve
puts
