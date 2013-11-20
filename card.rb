# Class that contains a card picker.
class Card

  # Constants for the values and suites of a card.
  SUITES = %w(hearts diamonds clubs spades).freeze
  VALUES = %w(2 3 4 5 6 7 8 9 10 11 12 13 14).freeze
  
  attr_reader  :count, :used

  # Initialized the count to the parameter and the used array.
  def initialize(count)
    @count = count
    @used = []
  end

  # Picks the card randomly.
  def pick()    
    card  = determine_card()
    
    # If the card has already been picked, pick again.
    if @used.include? card
      self.pick()
    end
    
    # Add the card to the used card array.
    @used << card
    
    return card
  end
  
  # Determine the value and suite of the card.
  def determine_card()
    rand_value = rand(VALUES.length)
    rand_suite = rand(SUITES.length)
  
    case VALUES[rand_value].to_i
      when 2..10
        return "#{VALUES[rand_value]} of #{SUITES[rand_suite]}"
      when 11
        return "Jack of #{SUITES[rand_suite]}"
      when 12
        return "Queen of #{SUITES[rand_suite]}"
      when 13
        return "King of #{SUITES[rand_suite]}"
      when 14
        return "Ace of #{SUITES[rand_suite]}"
    end
  end
end

# Argument (ARGV[0]) is the number of cards to be picked from a deck."
card = Card.new(ARGV[0].to_i)

# You must at least have one card to pick.
if card.count > 0 && card.count < 53
  for i in 1..card.count
    puts "Card #{i} is a #{card.pick()} \n"
  end
else
  raise "The number of cards to be picked is invalid, please pick between 1 and 52."
end