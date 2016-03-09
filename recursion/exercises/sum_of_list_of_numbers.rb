# Exercise: sum a list of numbers using recursion

module RecursiveArraySummer

  extend self

  def sum(array)
    size = array.size
    return array.first if size == 1

    array.first + sum(array.slice(1, size-1))
  end

end

# Sample Usage

list = [1, 2, 3, 10]
p list
puts "Sum: #{RecursiveArraySummer.sum(list)}"
puts

list = [1, 3, 5, 7, 9]
p list
puts "Sum: #{RecursiveArraySummer.sum(list)}"
puts

list = (1..100).to_a
p list
puts "Sum: #{RecursiveArraySummer.sum(list)}"
puts
