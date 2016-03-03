require_relative '../deque.rb'

# Exercise: check if string is a palindrome (a string that is the same fowards and backwards)

class Palindrome

  def initialize(check_string)
    @check_string = check_string
  end

  def is?
    character_deque = Deque.new
    is_palindrome = true

    @check_string.split("").each do |character|
      character_deque.add_rear(character)
    end

    while character_deque.size > 1 and is_palindrome
      front = character_deque.remove_front
      rear = character_deque.remove_rear

      is_palindrome = (front == rear)
    end

    is_palindrome
  end


end

puts "Checking if palindrome..."
puts

puts "football"
puts Palindrome.new("football").is?
puts

puts "radar"
puts Palindrome.new("radar").is?
puts
