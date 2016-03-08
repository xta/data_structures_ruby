# List

# A list is a collection of items where every item has a relative position to the other items. This is typically referred to as an unordered list. This list can have a 1st, 2nd, 3rd, etc. item. We can refer to the first item or the last item in the list.

# Sample implementation

class List

  # Notes:
  #   front is left/first position
  #   back is right/last position

  #   0 based index. the first position of the list starts at 0.

  #   We are (naively) assuming that lists do not contain duplicate items
  #   and not implementing some possible validation in methods.

  def initialize
    @collection = []
  end

  def add(element)
    @collection.push(element)
  end

  alias_method :append, :add

  def remove(element)
    @collection.delete(element)
  end

  def search?(element)
    index(element) != nil
  end

  def is_empty?
    @collection.empty?
  end

  def size
    @collection.size
  end

  def index(element)
    @collection.index(element)
  end

  def insert(position, element)
    @collection.insert(position, element)
  end

  def pop(position = nil)
    if position
      # pop the item at the position
      element = @collection[position]
      remove(element)
      return element

    else
      # pop the last item
      @collection.pop
    end
  end

end
