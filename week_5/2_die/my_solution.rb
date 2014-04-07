# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:
 #the input to initialize a die class would be an array of strings
# Output:
 #the output of Die.sides would be the length of the strings array
 #the output of Die.roll will be a single random string from the strings array
# Steps:
=begin
	Pseudocode:
	-- define Die class
		-- define initialize() to take a single array of strings
		 -- raise argument error if labels array is empty
		 -- set @labels to labels
		-- define sides()
			- return length of labels array
		-- define roll
			- return random value of labels array
=end
# 3. Initial Solution
=begin
class Die
  def initialize(labels)
  	raise ArgumentError.new("Labels list empty.") if labels == []
  	@labels = labels
  end

  def sides
  	@labels.length
  end

  def roll
  	@labels[rand(0..@labels.length - 1)]
  end
end
=end
# 4. Refactored Solution

class Die
  def initialize(labels)
  	raise ArgumentError.new("Labels list empty.") if labels == []
  	@labels = labels
  end

  def sides
  	@labels.length
  end

  def roll
  	@labels.sample
  end
end


# 1. DRIVER TESTS GO BELOW THIS LINE
begin 
	Die.new([])
rescue ArgumentError => a
	fail = a.message
end
p fail == "Labels list empty."
p Die.new(['a','b','c']).roll.is_a? String
p Die.new(['a']).roll == 'a'
p Die.new(['a','b','c']).sides == 3
p Die.new(['a']).sides == 1



# 5. Reflection 
=begin
	I found this challenge to be very enjoyable because I got some more practice with classes and class methods.
	My strategy was essentially the same as the other dice challenge, where I would look at the rspec tests, translate them 
	into driver test code, and then start writing pseudocode to follow. Since I followed these steps, writing the actual code was 
	very simple. I liked how I got some more practice with test-driver development. Overall I feel comfortable with the learning objectives,
	but could always use more practice. I enjoyed this challenge greatly because I got to use some more complicated methods.
=end