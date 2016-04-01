require_relative '../shell_sort.rb'

# output helper

def display_internal_state(ss)
  p ss.instance_variable_get(:@collection)
end

# Shell Sort usage

puts "Sorting using Shell Sort: [54,26,93,17,77,31,44,55,20]..."

shell_sort = ShellSort.new([54,26,93,17,77,31,44,55,20])
shell_sort.sort!

display_internal_state(shell_sort)
puts
