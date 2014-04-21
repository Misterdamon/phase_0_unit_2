# U2.W6: Refactoring for Code Readability


# I worked on this challenge by myself.



=begin
class CreditCard
	def initialize(number)
		raise ArgumentError.new("You must enter a valid credit card number.") unless number.to_s.length == 16
		@number = number
	end

	def check_card #While this solution is short, I feel like it could use some refactoring because it is very hard to follow what the code is actually doing when all the logic is on a single line.
		@number.to_s.reverse.split(//).map(&:to_i).map.with_index{|number,index| index.even? ? number : number * 2}.join.split(//).map(&:to_i).reduce(:+).%(10).zero?
	end
end
=end


# Refactored Solution
class CreditCard
	def initialize(number)
		raise ArgumentError.new("You must enter a valid credit card number.") unless number.to_s.length == 16 
		@number = number
	end

	def check_card 
		cc_num = @number.to_s.reverse.split(//).map(&:to_i) #sets cc_num to @number converted to a string, then reversed, then split into an array, then converts each string in the array and converts to an integer
		doubled_string = cc_num.map.with_index{|number,index| index.even? ? number : number * 2}.join #loops through each integer in the cc_num array and doubles the number if the index is odd, then rejoins the array into a string
		doubled_string.split(//).map(&:to_i).reduce(:+).%(10).zero? #splits the string and converts each number to an integer, then sums all these integers. After the sum is found, it checks to see if the modulus of the sum by 10 equals to zero. If it does, we return true, if not, return false
	end
	#even though this solution has more variables, I believe it is easier to follow and read than the original solution. 
end


# DRIVER TESTS GO BELOW THIS LINE
begin
	CreditCard.new(1)
rescue ArgumentError
	p $!
end

begin
	CreditCard.new(12131415123151231241241231234123)
rescue ArgumentError 
  p $!
end

p CreditCard.new(4408041234567893).check_card == true
p CreditCard.new(4408041234567892).check_card == false





# Reflection 
=begin
	For this challenge, I chose to refactor someone else's solution because I saw it and had a hard time understanding what was going on at first. Even though the solution was only one line, I felt
	that it had too much logic on one line and not enough explanation of each step. To me, writing good code is about a balance between readability and efficiency, and even though this solution works 
	fine, it would be hard for another programmer to know what the code is doing without dissecting each chained method in the program. My strategy here was basically to take the original solution and break it
	up into more readable units, with comments showing what each step does. I feel that the refactored solution is easier to understand than the original. Overall, I feel comfortable with the learning objectives
	for this challenge, but could always use more practice refactoring because I like to see the way that others accomplish the same problem. I didn't find any part of the challenge to be tedious, and enjoyed doing
		the refactoring!
=end