# Class that randomly generates a password.
class Password

  # Constant of characters to be used in the password
  CHARACTERS = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a + ('!'..'/').to_a
  
  class InvalidLengthException < Exception ; end 
  
  # Requires the length for the length of the password
  def initialize(length)
    @length = length
  end
  
  # Generates the random password.
  def generate()
    raise InvalidLengthException.new("The length of a password must be at least 6.") if @length < 6
    CHARACTERS.sort_by{ rand }.join[0..@length]
  end
end

# Argument 1 (ARGV[0]) is the length of the password.
# Argument 2 (ARGV[1]) is the number of passwords you want to generate.
password = Password.new(ARGV[0].to_i)
count = ARGV[1].to_i

begin
  count.times do
     puts password.generate() + "\n"
  end
rescue Password::InvalidLengthException => e
  puts e.message
end