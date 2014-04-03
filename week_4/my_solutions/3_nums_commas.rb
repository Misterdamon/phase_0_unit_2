# U2.W4: Separate Commas


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:
	# The input to this challenge would be a single integer value
# Output:
	# The output of this challenge would be the original integer input which has been converted to a string, and separated by commas.
# Steps:
=begin
	-- define separate_comma to take a single integer as an argument.
		-- if length of value as a string is less than 4
			-return value as a string
		-- assign temp variable to the input value as an array of chars
		-- assign index to -4
		-- while absolute value of index is less than length of temp array
			- insert comma at index value
			- decrement index by 4
		-- return temp array joined into a single string
	--
=end
# 3. Initial Solution
=begin 

	test_val = 11234123

	def separate_comma(value)
		if value.to_s.length < 4 #if number doesn't need commas, return it as a string
			return value.to_s
		end 
		
		temp = value.to_s.chars
		index = -4
		
		while index.abs <= temp.length
			temp.insert(index,',')
			index -= 4
		end
		temp.join
		
	end

	puts separate_comma(test_val)
=end

# 4. Refactored Solution
# I refactored my solution to use an unless statement because it looked more concise and readable this way. I also made my variables more self-explanatory
def separate_comma(value)
		return value.to_s unless value.to_s.length > 4 #return value as string unless length > 4
		
		tempChars = value.to_s.chars #converts value to a string, then to array of chars
		indexFromEnd = -4 #using a negative index to insert() a comma from the end of the array of chars, insert() puts a comma in AFTER the specified index
		
		while indexFromEnd.abs <= tempChars.length #while the absolute value of index is less than the length of the chars array
			tempChars.insert(indexFromEnd,',') #inserts a comma at the specified negative index
			indexFromEnd -= 4 #decrements index to insert the next comma into the string
		end
		tempChars.join #returns array of chars with commas join()ed into one string
end



# 1. DRIVER TESTS GO BELOW THIS LINE
p separate_comma(111).is_a? String
p separate_comma(100) == "100"
p separate_comma(1) == "1"
p separate_comma(123456789) == "123,456,789"
p separate_comma(10000) == "10,000"
p separate_comma(10245554) == "10,245,554"
p separate_comma(1234444) == "1,234,444"





# 5. Reflection 
=begin
	I loved this solo challenge! It required me to think very critically about what exactly I was trying to do in my code. 
	My process was essentially to look at the sample outputs from the instructions and decide how to proceed from there. 
	I got to use a few ruby methods that I hadn't used before, like insert and abs. My pseudocode for this challenge actually 
	turned out to work great and I had very little trouble translating it into code. The only trouble I had with this code was figuring 
	out how to actually insert the commas, but after discovering the insert method on the ruby documentation, I had found the perfect 
	candidate for my design. Overall I greatly enjoyed this challenge because I got to learn more about different string and integer methods, 
	and I feel very comfortable with the learning objectives so far. I didn't really find any part of this challenge tedious because I truly enjoyed
	writing the code for it. 
=end


