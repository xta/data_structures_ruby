# Exercise: convert a number into a string representation in base notation

# For example, the number 10 as binary (base 2) is "1010"

module NumberToBaseString

  extend self

  BASE_LEGEND = "0123456789ABCDEF".freeze

  def convert(number, base)
    if number < base
      BASE_LEGEND[number]
    else
      convert(number / base, base) + BASE_LEGEND[number % base]
    end
  end

end


# Sample Usage

puts "Convert 10 with base 2..."
puts NumberToBaseString.convert(10, 2)
