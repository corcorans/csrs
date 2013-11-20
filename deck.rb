# Class that contains a card picker.
class Deck

  SUITS = %w(hearts diamonds clubs spades)
  VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  SINGLE_DECK = SUITS.map { |s| VALUES.map { |c| "#{c} of #{s}" } }.flatten.freeze

  # Custom exception class.
  class NoMoreCardsException < Exception ; end
  
  # Load the appropriate number of cards into the array.
  def initialize(number_of_decks)
    @deck = (SINGLE_DECK * number_of_decks).shuffle
  end
  
  # Pick a card from the top of the deck.
  def pick
    raise NoMoreCardsException.new("Deck is empty") if cards_left == 0
    @deck.shift
  end
  
  # Number of cards.
  def cards_left
    @deck.length
  end
end

deck = Deck.new(ARGV[1].to_i)
count = ARGV[0].to_i

begin 
  count.times do |i|
    puts "Card #{i + 1} is a #{deck.pick}"
  end
rescue Deck::NoMoreCardsException => e
  puts e.message
end