# Exercise: tower of Hanoi

# Notes
# * there are three poles
# * can only move 1 disk at a time
# * a larger disk cannot be placed on a smaller disk

class TowerOfHanoi

  def initialize(height)
    @from_pole = (1..height).to_a.reverse
    @with_pole = []
    @to_pole = []

    @pole_lookup = {
      "A" => @from_pole,
      "B" => @with_pole,
      "C" => @to_pole,
    }

    display_poles
  end

  def move_tower(height, from_pole, to_pole, with_pole)
    if height >= 1
      move_tower(height-1, from_pole, with_pole, to_pole)
      move_disk(from_pole, to_pole)
      move_tower(height-1, with_pole, to_pole, from_pole)
    end
  end

  def move_disk(from_pole, to_pole)
    puts "Disk was moved from #{from_pole} to #{to_pole}"

    from_element = @pole_lookup[from_pole].pop
    destination_pole = @pole_lookup[to_pole].push(from_element)
    display_poles
  end

  def display_poles
    puts "A: #{@from_pole}"
    puts "B: #{@with_pole}"
    puts "C: #{@to_pole}"
    puts "---"
    puts
  end

end

# Sample Usage

height = 10
tower = TowerOfHanoi.new(height)
tower.move_tower(height, "A", "C", "B")




