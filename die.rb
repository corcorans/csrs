# Simple class that rolls a die and returns the value the was rolled.
# A die of any number of sides can be used.
class Die

   attr_reader :sides, :value, :number

  # Needs the number of die and the number of sides the die has.
  def initialize(number, sides)
    @sides = sides
    @number = number
  end
  
  # Performs a random roll based upon the number of sides the die has.
  def roll()
    if @sides != 0
      if @sides >= 6 
        @value = rand(@sides) + 1
      else
        raise "Please enter an appropriate number of sides for a die."
      end
    else
      raise "Please enter the number of sides for a die."
    end
  end
end

# Argument 1 (ARGV[0]) is the number of die
# Argument 2 (ARGV[1]) is the number of sides for the die
die = Die.new(ARGV[0].to_i, ARGV[1].to_i)

# Print out the value rolled for each number of die
for i in 1..die.number()
  die.roll()
  puts "You rolled a #{die.value} \n" 
end