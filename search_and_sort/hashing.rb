# Hashing / Hash

# A hash table allows you to store & retrieve objects with a key.
# A hash can also be called a dictionary, map, or associative array.

# A hash table works by hashing the key to find its place in the hash.
# That means that keys have to be hashable.

class SimplisticHash

  # SimplisticHash is a basic, naive hash implementation
  # that uses a small number of hash slots and modulo

  # note the key size is 11, a prime number

  def initialize
    keys = (0..10).to_a
    @collection = keys.inject({}) {|hash, key| hash[key] = nil; hash}
    @size = keys.size
  end

  def set(item)
    key = hasher(item)
    @collection[key] = item
  end

  def get(item)
    key = hasher(item)
    @collection[key]
  end

  private

  def hasher(item)
    item % @size
  end

end

class FoldingHash

  # divide the item into equal sized pieces (last piece might not be the same size)
  # add the pieces together
  # divide by the number of slots

  def initialize
    keys = (0..10).to_a
    @collection = keys.inject({}) {|hash, key| hash[key] = nil; hash}
    @size = keys.size
  end

  def set(item)
    key = hasher(item)
    @collection[key] = item
  end

  def get(item)
    key = hasher(item)
    @collection[key]
  end

  private

  def hasher(string_item)
    string_item.gsub!("-", "") if string_item.include?("-")
    parts = string_item.chars.each_slice(2).map(&:join)
    numbers = parts.map(&:to_i)
    sum = numbers.inject(0, :+)
    sum % @size
  end

end

class MidSquareHash

  # square the item
  # extract the middle two digits
  # get the remainder using modulo

  def initialize
    keys = (0..10).to_a
    @collection = keys.inject({}) {|hash, key| hash[key] = nil; hash}
    @size = keys.size
  end

  def set(item)
    key = hasher(item)
    @collection[key] = item
  end

  def get(item)
    key = hasher(item)
    @collection[key]
  end

  private

  def hasher(item)
    squared = item**2
    length = squared.to_s.length
    midpoint = length/2

    if length.even?
      middle = squared.to_s[midpoint-1..midpoint]
    else
      middle = squared.to_s[midpoint]
    end

    middle.to_i % @size
  end

end

class CharacterOrdinalHash

  # get the ordinal value of each string character
  # add the sum of the ordinal values
  # get the remainder using modulo

  def initialize
    keys = (0..10).to_a
    @collection = keys.inject({}) {|hash, key| hash[key] = nil; hash}
    @size = keys.size
  end

  def set(item)
    key = hasher(item)
    @collection[key] = item
  end

  def get(item)
    key = hasher(item)
    @collection[key]
  end

  private

  def hasher(string_item)
    sum = 0
    string_item.each_codepoint {|c| sum+= c}
    sum % @size
  end

end
