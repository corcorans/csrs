# Class that contains a card picker.
class Deck

  SUITS = %w(hearts diamonds clubs spades)
  VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  
  attr_reader :count, :card_count, :deck_num

  # Load the appropriate number of cards into the array.
  def initialize(count, deck_num)
    @count = count
    @deck_num = deck_num
    @card_count = @deck_num * 52 + 1
    
    self.load_deck
  end

  def load_deck
    @deck = (1..@deck_num).map { SUITS.map { |s| VALUES.map { |c| "#{c} of #{s}"}}}.flatten
    @active_deck = (@deck * @deck_num).shuffle
  end
  
  # Pick a card from the top of the deck.
  def pick
    return @active_deck.shift
  end
end

# Argument (ARGV[0]) is the number of cards to be picked from a deck."
deck = Deck.new(ARGV[0].to_i, ARGV[1].to_i)

# You must at least have one card to pick.
if deck.count > 0 && deck.count < deck.card_count
  for i in 1..deck.count
    puts "Card #{i} is a #{deck.pick} \n"
  end
else
  raise "The number of cards (#{deck.count}) to be picked for the number of decks (#{deck.deck_num}) is invalid"
end