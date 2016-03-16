# Sequential Search

# Sequential search is a search (return if item is in collection) that iterates through each item in order.

# The best case is a match in the first compared item.
# The average case (collection items are unordered) is the size of the collection divided by 2.
# The worst case is determining the result (match or not) at the last compared item.

class SequentialSearch

  # note: purposely not using built in ruby methods such as #include?
  # since we want to sequentially step through each item in the collection and compare

  def initialize(collection)
    @collection = collection
  end

  def search?(lookup_item)
    @collection.each do |member|
      return true if lookup_item == member
    end

    false
  end

end

class OrderedSequentialSearch

  def initialize(collection)
    @collection = collection.sort
  end

  def search?(lookup_item)
    @collection.each do |member|
      return true if lookup_item == member
      return false if member > lookup_item
    end

    false
  end

end
