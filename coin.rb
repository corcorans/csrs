# Class that simulates a coin flip which also allows multiple coins.
class Coin

  # Performs the flip for a coin.
  def flip
    (1 + rand(2)) == 1 ? "heads" : "tails"
  end
end

# Argument (ARGV[0]) is the number of coins to be flipped.
coin = Coin.new
count = ARGV[0].to_i

count.times do |i|
  puts "Coin #{i + 1} was #{coin.flip}\n"
end