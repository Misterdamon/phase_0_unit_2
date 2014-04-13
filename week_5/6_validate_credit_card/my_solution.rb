# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge by myself

# 2. Pseudocode

# Input:
# THe input is a single 16 digit integer that is passed into the initalize method
# Output:
# THe output is true or false depending on the verification of the card number
# Steps:
=begin
	Pseudocode:
	 -- define initialize to take a single integer parameter
	  -- raise argument error if parameter not 16 digits
	  -- assign @card_number to integer parameter
	 -- define check_card to take no parameters
	  --assign output to empty array
	  --assign temp to the following:
	    - convert card_number to string
	  	- split string to array of strings
	  	- reverse array of strings
	  	- map each string back into an integer, so we are left with an array of integers
    -- assign index to 1
    -- push last digit (first digit in reversed array) into output
    -- while i < temp.length
     - push temp[i] * 2 into output
     - push temp[i+1] into output so we don't double every element, only every other
     - increment i by 2
    --assign total to 0
    -- compact output and iterate through each element
     -- if element >= to 10
     	- convert elem to string
     	- split this string
     	 -- iterate through each value in split string
     	  - convert to integer and add to total
		 -- else if element !>= 10
		  - push elem into output
		-- if total % 10 == 0
		 -return true
		--else
			-return false

=end
# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
=begin
class CreditCard
	def initialize(card_number)
		if card_number.to_s.length != 16
			raise ArgumentError.new("You have given an invalid card format.")
		end
		@card_number = card_number
  end

  def check_card
  	output = []
  	temp = @card_number.to_s.split('').reverse.map!(&:to_i) #converts @card_number to string, then array of strings, then reverses, then converts all string values to integers in an array. The temp var results in an array of integers
  	
  	i = 1 #index for doubling the array values
  	output<<temp[0] #push last value (first in reversed array) into output array, then start doubling every other one
  	while i < temp.length
  		output << temp[i] * 2 #doubles value at index
  		output << temp[i+1] #pushes next index value into output because we aren't doubling it
  		i += 2 #increase index by 2 so we can double every other
    end
 
  	total = 0
  	output.compact.each do |x| #compact removes nil values from array
  		if x >= 10
  			x.to_s.split('').each { |y| total += y.to_i } #if the integer is >= 10, we convert to string then split it and add the single digits to total as integers
  		else
  			total += x #if integer less than 10, we just add to total
  		end #end if
  	end #end each
  	
  	if total % 10 == 0
  		return true
  	else
  		return false
  	end #end if

  end #end check_card

end#end CreditCard
=end
# 4. Refactored Solution
class CreditCard
	def initialize(card_number)
		if card_number.to_s.length != 16
			raise ArgumentError.new("You have given an invalid card format.")
		end
		@card_number = card_number
  end

  def check_card
  	output = []
  	temp = @card_number.to_s.split('').reverse.map!(&:to_i) #converts @card_number to string, then array of strings, then reverses, then converts all string values to integers in an array. The temp var results in an array of integers
  	
  	temp.each_with_index do |elem,i| #replaced while loop with each_with_index loop
  		output << elem * 2 if i.odd? #doubles element if index is odd, and pushes into output
  		output << elem if i.even? #
 		end

  	total = 0
  	output.each do |num| 
  		if num >= 10
  			num.to_s.split('').each { |x| total += x.to_i } #if the integer is >= 10, we convert to string then split it and add the single digits to total as integers
  		else
  			total += num #if integer less than 10, we just add to total
  		end #end if
  	end #end each
  	
  	return false if total % 10 != 0 #return false if total % 10 != 0
  	true #return true otherwise
  end #end check_card

end#end CreditCard


# 1. DRIVER TESTS GO BELOW THIS LINE
begin
	CreditCard.new(1)
rescue ArgumentError => e
		p e.message == "You have given an invalid card format."
end

begin
	CreditCard.new(12131415123151231241241231234123)
rescue ArgumentError => err
  p err.message == "You have given an invalid card format."
end

p CreditCard.new(4408041234567893).check_card == true
p CreditCard.new(4408041234567892).check_card == false

# 5. Reflection 
=begin
	For this challenge, it was a bit harder to write pseudocode because the steps were much more complicated, so my strategy was to break down the steps into pseudocode as clearly
	as possible. I had to go back and change the pseudocode a few times when writing this program, because my previous steps didn't quite work. Other than that, I learned alot during
	the challenge, and got some valuable experience with the each iterator, which I was still sort of confused on. I had a true 'aha' moment when I worked with each_index, and finally
	figured out how to use it correctly. Overall, I feel more confident with classes and ruby iteration methods, and would be able to apply them to other situations. The only part of the
	challenge that I found to be tedious was my refactoring, but I ended up learning a lot so it became enjoyable after a while.
=end