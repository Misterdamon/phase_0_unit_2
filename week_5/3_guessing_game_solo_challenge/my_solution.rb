# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:
	# The input of GuessingGame.initialize would be a single integer
	#the input of guess would be a single integer that is compared to the @answer
# Output:
	#guess() returns low, high, or correct as a symbol depending on answer/guess comparison
	#solved? returns true or false depending on whether the guess was correct
# Steps:
=begin --define class GuessingGame
	--define initialize to take a single interger as parameter
		- set instance var @answer to answer
	-- define guess to take a single integer parameter
	 - if guess > answer, set result to :high
	 - if guess < answer, set result to :low
	 - if guess == answer, set rsult to :correct
	-- define solved? to take no parameters
	 -- return true if @result == correct, false otherwise
=end
# 3. Initial Solution
=begin
class GuessingGame

  def initialize(answer)
    @answer = answer
    @last_result = nil
    @last_guess = nil
  end
  
  def guess(guess)
  	@last_guess = guess
		if @last_guess > @answer
			@last_result = :high
  	elsif @last_guess < @answer
  		@last_result = :low
  	else
  		@last_result = :correct
  		
  	end
  end
  
  def solved?
    if @last_result == :correct
    	true
    else
    	false
    end
  end
  # Make sure you define the other required methods, too
end
=end

# 4. Refactored Solution
class GuessingGame

  def initialize(answer)
    @answer = answer
  end
  
  def guess(guess)
		if guess > @answer
			puts "Too high"
			@result = :high
  	elsif guess < @answer
  		puts "Too low"
  		@result = :low
  	else
  		puts "You got the correct answer!"
  		@result = :correct
  	end
  end
  
  def solved?
    if @result == :correct
    	true
    else
    	false
    end
  end
end

#THIS IS THE LOOP THAT ALLOWS THE GAME TO BE PLAYED THROUGH THE TERMINAL
#game = GuessingGame.new(rand(100))

#while !game.solved?
	#puts "Enter your guess:"
	
	#game.guess(gets.chomp.to_i)
#end





# 1. DRIVER TESTS GO BELOW THIS LINE
test_game = GuessingGame.new(10)
p test_game.guess(0) == :low
p test_game.guess(10) == :correct
p test_game.guess(5) == :low
p test_game.guess(52) == :high







# 5. Reflection 
=begin
	In this challenge, I found it easiest to start with the rspec tests to see what requirements needed to be fulfilled. I went through each test to satisify all conditions 
	of the program, and then started writing pseudocode to solve each step. It was nice to get some more practice with class methods and instance variables in this challenge, because
	I certainly could use all the practice I can get on object-oriented design. I didn't really have any 'AHA' moments in this challenge, but it was still nice to get more practice
	writing ruby code. Also, this was the first time I had used symbols in any real capacity, so that was great to know as well. Overall I feel comfortable with the learning objectives and
	am ready to do the next challenge! I found this challenge to be somewhat tedious just because we had done programs like it earlier this week. 

=end
