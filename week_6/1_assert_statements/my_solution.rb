# U2.W6: Testing Assert Statements

# I worked on this challenge by myself

# 2. Review the simple assert statement

def assert
  raise "Assertion failed!" unless yield
end

name = "bettysue"
assert { name == "bettysue" }
#assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs
=begin
	Pseudocode:
		-- define assert
			- raise "Assertion Failed" unless the block yields true
		-- when the code is run, the first assert yields true because name == "bettysue" in the block, and doesn't raise an error
		-- the second assert fails because name does not equal "billybob", and an error is raised
=end
# 3. Copy your selected challenge here
#Challenge 6 from week 5 -- Validate Credit Card
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



# 4. Convert your driver test code from that challenge into Assert Statements
begin
	CreditCard.new(1)
rescue ArgumentError => e
		assert {e.message == "You have given an invalid card format."}
end

begin
	CreditCard.new(12131415123151231241241231234123)
rescue ArgumentError => err
  assert {err.message == "You have given an invalid card format."}
end

assert { CreditCard.new(4408041234567893).check_card}
assert { !CreditCard.new(4408041234567892).check_card}




# 5. Reflection
=begin
	For this challenge, I chose to use the Credit Card Validator program from week 5, because I had the most fun coding it. It was great to learn about the assert statement as well as get
	some review on blocks and the yield keyword again. My strategy was basically to take each one of my driver tests and convert it to an assert statement that uses a block that evaluates to true or false,
	so if any of my tests fail, I should have an error that shows me the backtrace of the failure. I'm going to have to delve deeper into the different types of assert statements if I want to get more detailed with
	my tests, but as of now I feel comfortable with writing them. So far I feel comfortable with the learning objective for this challenge, but could always use more experience in writing test code because it makes
	development sooo much easier. I didn't really find any part of this challenge tedious because it was rather simple to accomplish.
=end
