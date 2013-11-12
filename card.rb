# Class that contains a card picker.
class Card

  # Constants for the values and suites of a card.
  SUITES = %w(hearts diamonds clubs spades).freeze
  VALUES = %w(2 3 4 5 6 7 8 9 10 11 12 13 14).freeze
  
  attr_reader  :count, :card, :used

  # Initialized the count to the parameter and the used array.
  def initialize(count)
    @count = count
    @used = []
  end

  # Picks the card randomly.
  def pick()    
    rand_value = rand(VALUES.length)
    rand_suite = rand(SUITES.length)    

    @check = VALUES[rand_value]
    
    case VALUES[rand_value].to_i
    when 2..10
      @card = "#{VALUES[rand_value]} of #{SUITES[rand_suite]}"
    when 11
      @card = "Jack of #{SUITES[rand_suite]}"
    when 12
      @card = "Queen of #{SUITES[rand_suite]}"
    when 13
      @card = "King of #{SUITES[rand_suite]}"
    when 14
      @card = "Ace of #{SUITES[rand_suite]}"
    end
    
    if @used.include? @card
      self.pick()
    end
    
    @used << @card
  end
end

# Argument (ARGV[0]) is the number of cards to be picked from a deck."
card = Card.new(ARGV[0].to_i)

# You must at least have one card to pick.
if card.count > 0 && card.count < 53
  for i in 1..card.count
    card.pick()
    puts "Card #{i} is a #{card.card} \n"
  end
else
  raise "The number of cards to be picked is invalid please pick between 1 and 52."
end