# Simple class that rolls a die and returns the value the was rolled.
# A die of any number of sides can be used.
class Die

  # Custom exception class.
  class InvalidSidesException < Exception ; end

  # Needs the number of die and the number of sides the die has.
  def initialize(sides)
    @sides = sides
  end
  
  # Performs a random roll based upon the number of sides the die has.
  def roll()
    raise InvalidSidesException.new("A number of sides is needed for a die.") if @sides == 0
    raise InvalidSidesException.new("An appropriate number of sides is required.") if @sides < 6
    
    rand(@sides) + 1
  end
end

# Argument 1 (ARGV[0]) is the number of die
# Argument 2 (ARGV[1]) is the number of sides for the die
die = Die.new(ARGV[1].to_i)
count = ARGV[0].to_i

begin
  count.times do |i|
    puts "Die #{i + 1} is #{die.roll}"
  end
rescue Die::InvalidSidesException => e
  puts e.message
end