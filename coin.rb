# Class that simulates a coin flip which also allows multiple coins.
class Coin
   attr_reader :coins, :flip, :value

  # Needs the number of coins that are to be flipped
  def initialize(coins)
    @coins = coins
  end
  
  # Performs the flip for a coin.
  def flip()
    if @coins > 0 
      @flip = 1 + rand(2)
      @value = @flip == 1 ? "heads" : "tails"
    else
      raise "The number of coin(s) must be at least one."
    end
  end
end

# Argument (ARGV[0]) is the number of coins to be flipped.
coin = Coin.new(ARGV[0].to_i)

for i in 1..coin.coins()
  coin.flip()
  puts "Coin #{i} was #{coin.value} \n"
end