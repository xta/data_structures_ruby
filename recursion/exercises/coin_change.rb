# Exercise: provide coin change for a given amount of money

module CoinChange

  extend self

  BLANK_KEYS = (1..100).to_a
  BLANK_RESULTS = Hash[BLANK_KEYS.zip([0] * BLANK_KEYS.size)]

  # Note: change is the amount that you want to recreate using the possible coin_values

  def recursive_calculate(coin_values, change, known_results = BLANK_RESULTS)
    minimum_coins = change

    if coin_values.include? change
      known_results[change] = 1
      return 1
    elsif known_results[change] > 0
      return known_results[change]
    else

      new_coins = coin_values.select { |c| c <= change }
      new_coins.each do |coin|
        number_of_coins = 1 + recursive_calculate(coin_values, change-coin, known_results)

        if number_of_coins < minimum_coins
          minimum_coins = number_of_coins
          known_results[change] = minimum_coins
        end
      end

    end

    minimum_coins
  end

  # iterative

  def dynamic_calculate(coin_values, change)
    minimum_coins = [0]*(change + 1)
    cents_range   = (0..change + 1).to_a

    cents_range.each do |cents_ceiling|
      coin_count          = cents_ceiling # placeholder
      coins_below_ceiling = coin_values.select { |c| c <= cents_ceiling }

      coins_below_ceiling.each do |coin|
        # check if current coin gets us to the amount with a lower coin_count
        if minimum_coins[cents_ceiling - coin] + 1 < coin_count
          # if so, set coin_count since this coin gets us a lower coin_count
          coin_count = minimum_coins[cents_ceiling - coin] + 1
        end
      end
      # save/set the lowest coin_count
      minimum_coins[cents_ceiling] = coin_count
    end

    minimum_coins[change]
  end

  # iterative with coins used output

  def dynamic_calculate_with_coins_used(coin_values, change, coins_used)
    minimum_coins = [0]*(change + 1)
    cents_range   = (0..change + 1).to_a

    cents_range.each do |cents_ceiling|
      coin_count          = cents_ceiling # placeholder
      new_coin            = 1
      coins_below_ceiling = coin_values.select { |c| c <= cents_ceiling }

      coins_below_ceiling.each do |coin|
        if minimum_coins[cents_ceiling - coin] + 1 < coin_count
          coin_count = minimum_coins[cents_ceiling - coin] + 1
          new_coin = coin
        end
      end

      minimum_coins[cents_ceiling]  = coin_count
      coins_used[cents_ceiling]     = new_coin
    end

    minimum_coins[change]
  end

  def find_coins_used(coins_used, change)
    coin = change
    used = []

    while coin > 0
      the_coin = coins_used[coin]
      used << the_coin
      coin -= the_coin
    end

    used
  end

end

# Sample Usage

puts "# Solving using recursion..."

puts "To make 63 cents, what is the minimum number of coins you can use?"
puts CoinChange.recursive_calculate([1,5,10,25], 63)

puts "To make 50 cents, what is the minimum number of coins you can use?"
puts CoinChange.recursive_calculate([1,5,10,25], 50)

puts "---"
puts


puts "# Solving using iteration..."

puts "To make 63 cents, what is the minimum number of coins you can use?"
puts CoinChange.dynamic_calculate([1,5,10,25], 63)

puts "To make 51 cents, what is the minimum number of coins you can use?"
puts CoinChange.dynamic_calculate([1,5,10,25], 51)

puts "---"
puts


puts "# Solving using iteration with coins used output..."

change = 63
used_coins = [0]*(change + 1)

puts "To make #{change} cents, what is the minimum number of coins you can use?"
puts CoinChange.dynamic_calculate_with_coins_used([1,5,10,25], change, used_coins)
puts "What are the coins used?"
p CoinChange.find_coins_used(used_coins, change)
puts

change = 51
used_coins = [0]*(change + 1)

puts "To make #{change} cents, what is the minimum number of coins you can use?"
puts CoinChange.dynamic_calculate_with_coins_used([1,5,10,25], change, used_coins)
puts "What are the coins used?"
p CoinChange.find_coins_used(used_coins, change)
puts
