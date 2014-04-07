# U2.W5: Die Class 1: Numeric


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:
	#the input in this case would be a number of sides for the die, the input is only needed when initializing a dice
# Output:
	# depending on the class function called on the die, the ouput will differ. The output of Die.sides would be the number of sides given in the initialization.
	# the output of the Die.roll function will be a random number between 1 and the number of sides
# Steps:
=begin
	Pseudocode:
		-- define class Die
			-- define function initialize() to take a single integer as a parameter.
			 -- if sides < 1, raise Argument error
			 -- set instance var sides to sides argument of initialize
			-- define function sides()
				- return @sides
			-- define function roll()
				- define a range from 1 to the number of sides
				 -- convert this range to an array
				 -- call sample on this array and return that number
=end
# 3. Initial Solution
=begin
class Die
  def initialize(sides)
  	if sides < 1
  	raise ArgumentError.new("Dice must have a positive number of sides.")
  	end
    @sides = sides
  end
  
  def sides
    @sides
  end
  
  def roll
   (1..@sides).to_a.sample
  end
end

=end

# 4. Refactored Solution
class Die
  def initialize(sides)
  	raise ArgumentError.new("Dice must have a positive number of sides.") if sides < 1
    @sides = sides
  end
  
  def sides
    @sides
  end
  
  def roll
   rand(1..@sides)
  end
end


# 1. DRIVER TESTS GO BELOW THIS LINE
p Die.new(6).roll.is_a? Fixnum 
p Die.new(100).sides == 100
p Die.new(6).sides == 6
begin
	Die.new(0)
rescue ArgumentError => a
	fail = a.message
end
p fail == "Dice must have a positive number of sides."






# 5. Reflection 
=begin
	For this challenge, my process was basically to look at the rspec tests to determine what requirements needed to be satisfied. This was simple enough to do
	because I had worked with classes and rspec tests before. I learned how to use begin/rescue/end to catch an argument error, which was nice to know, because 
	I can implement argument tests without using rspec. Overall, I feel comfortable with the learning objectives so far and am excited to learn more about classes
	in the coming weeks. I enjoyed this challenge a lot because I got to use instance variables and learned how to write more complicated driver test code.
=end