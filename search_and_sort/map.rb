# Map

# A map is also known as an associative array, dictionary, or hash.
# The items in the collection are unordered.
# Each item is a association between a key and a value.
# Each key is unique.

class Map

  # note: 11 was chosen since it is prime

  def initialize(collection_size = 11)
    @collection_size = collection_size
    @keys = Array.new(collection_size)
    @values = Array.new(collection_size)
  end

  def set(key, value)
    hash_index = hasher(key, @keys.size)

    if @keys[hash_index].nil?
      @keys[hash_index] = key
      @values[hash_index] = value
    else
      if @keys[hash_index] == key
        # overwrite/replace the value/data
        @values[hash_index] = value
      else
        next_key_index = rehash(hash_index, @keys.size)

        while @keys[next_key_index] != nil and @keys[next_key_index] != key
          next_key_index = rehash(next_key_index, @keys.size)
        end

        if @keys[next_key_index].nil?
          @keys[next_key_index] = key
          @values[next_key_index] = value
        else
          # overwrite/replace the value/data
          @values[next_key_index] = value
        end
      end
    end
  end

  alias_method :put, :set
  alias_method :[]=, :set

  def get(key)
    start_slot = hasher(key, @keys.size)
    position = start_slot
    value = nil

    while @keys[position] != nil
      if @keys[position] == key
        value = @values[position]
        break
      else
        position = rehash(position, @keys.size)
        break if position == start_slot
      end
    end

    value
  end

  alias_method :[], :get

  # note: #delete is similar logic to #set, but heavily modified
  def delete(key)
    return unless in?(key)

    hash_index = hasher(key, @keys.size)

    if @keys[hash_index] == key
      @keys[hash_index] = nil
      @values[hash_index] = nil
    else
      next_key_index = rehash(hash_index, @keys.size)

      while @keys[next_key_index] != nil and @keys[next_key_index] != key
        next_key_index = rehash(next_key_index, @keys.size)
      end

      @keys[next_key_index] = nil
      @values[next_key_index] = nil
    end
  end

  alias_method :del, :delete

  def size
    @keys.compact.size
  end

  alias_method :len, :size

  # note: #in? is similar logic to #get
  def in?(key)
    start_slot = hasher(key, @keys.size)
    position = start_slot
    found = false

    while @keys[position] != nil and !found
      if @keys[position] == key
        found = true
      else
        position = rehash(position, @keys.size)
        break if position == start_slot
      end
    end

    found
  end

  private

  def hasher(key, size)
    key % size
  end

  def rehash(old_hash_index, size)
    (old_hash_index + 1) % size
  end

end
