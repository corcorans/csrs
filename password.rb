# Class that randomly generates a password key.
class Password
  
  # Constant of characters to be used in the password
  CHARACTERS = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a + ('!'..'/').to_a
  
  attr_reader :number
  
  # Requires the length for the length of the password
  def initialize(length, number)
    @@length = length
    @number = number
  end
  
  # Generates the random password.
  def generate()
    CHARACTERS.sort_by{ rand }.join[0..@@length]
  end
end

# Argument 1 (ARGV[0]) is the length of the password.
# Argument 2 (ARGV[1]) is the number of passwords you want to generate.
password = Password.new(ARGV[0].to_i, ARGV[1].to_i)

# Keep generating passwords until the given amount.
count = 0
until count == password.number
  puts password.generate() + "\n"
  count += 1
end