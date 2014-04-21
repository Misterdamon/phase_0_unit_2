# U2.W6: PezDispenser Class from User Stories


# I worked on this challenge by myself.

# 1. Review the following user stories:
# - As a pez user, I'd like to be able to "create" a new pez dispenser with a group of flavors that 
#      represent pez so it's easy to start with a full pez dispenser.
# - As a pez user, I'd like to be able to easily count the number of pez remaining in a dispenser 
#      so I can know how many are left.
# - As a pez user, I'd like to be able to take a pez from the dispenser so I can eat it.
# - As a pez user, I'd like to be able to add a pez to the dispenser so I can save a flavor for later.
# - As a pez user, I'd like to be able to see all the flavors inside the dispenser so I know the order 
#      of the flavors coming up.


# 2. Pseudocode
=begin
	Pseudocode:
		-- define PezDispenser Class
		 - set attr_reader for :flavors
		-- define initialize to take an array as argument
			-set @flavors to flavors
		-- define see_all_pez
			- output @flavors to console
	  -- define pez_count
	  	- return @flavors.length
	  -- define add_pez to take a single string argument
	    - push argument to @flavors array
	  -- define get_pez
	    - remove last pez from @flavors array
	  -- define assert
	  	- raise "test failed" unless block evaluates to true
=end
# 3. Initial Solution
=begin
class PezDispenser
	attr_reader :flavors

	def initialize(flavors = [])
		@flavors = flavors
	end 

	def see_all_pez
 		@flavors.each {|x| puts x}
	end
 
	def pez_count
		@flavors.length
	end 

	def add_pez(flavor)
		@flavors << flavor
	end

	def get_pez
		@flavors.shuffle!.shift.to_s
	end
end
=end
# 4. Refactored Solution
class PezDispenser
	attr_reader :flavors

	def initialize(flavors = [])
		@flavors = flavors
	end 

	def see_all_pez
 		puts @flavors #outputs contents of @flavors to console
	end
 
	def pez_count
		@flavors.length #returns @flavors.length
	end 

	def add_pez(flavor)
		raise ArgumentError.new("Invalid flavor.") if not flavor.is_a?(String)
		@flavors << flavor #adds parameter 'flavor' to @flavors array
	end

	def get_pez
		#I refactored get_pez to use pop instead of shift
		@flavors.pop #removes last pez from @flavors array and returns it
	end
end

def assert 
	raise "Test failed" unless yield
end



# 1. DRIVER TESTS GO BELOW THIS LINE

flavors = %w(cherry chocolate cola grape lemon orange peppermint raspberry strawberry).shuffle
super_mario = PezDispenser.new(flavors)
puts "A new pez dispenser has been created. You have #{super_mario.pez_count} pez!"  
puts "Here's a look inside the dispenser:"  
puts super_mario.see_all_pez 
puts "Adding a purple pez."
super_mario.add_pez("purple")   # mmmmm, purple flavor
puts "Now you have #{super_mario.pez_count} pez!"
puts "Oh, you want one do you?"
puts "The pez flavor you got is: #{super_mario.get_pez}"
puts "Now you have #{super_mario.pez_count} pez!"

assert{flavors.is_a? Array} #test to see if flavors is an array
assert{super_mario.instance_variable_get(:@flavors).is_a? Array} #checks to see if @flavors is an array after being initialized with 'flavors'
assert{PezDispenser.new(flavors).pez_count.is_a? Fixnum} #checks to see if pez_count returns an integer
assert{PezDispenser.new(flavors).get_pez.is_a? String} #Checks to see if get_pez returns a string
assert{PezDispenser.new.instance_variable_get(:@flavors) == []} #checks to see if default initialization is working.

begin
	super_mario.add_pez(1)
rescue
  puts $!
end


# 5. Reflection
=begin 
	I enjoyed this challenge because I like working with classes, and pez is seriously like my favorite candy ever. It was great to get some more practice with classes and the scope of instance variables, as well as more practice with
	writing tests using an assert statement. I didn't do a whole lot of refactoring in this solution because most of my methods were just one line of logic and it wouldn't really do all that much if I refactored. I'm still getting the hang of writing
		assert statements, but it seems like they aren't much better than Driver Test code at this point. Next week I'm going to try to write some more detailed assert methods and some rspec, so that I can get more good practice with writing tests. Overall I feel comfortable with
		the learning objectives so far, and am excited to start the unit 3 curriculum! I didn't really find any part of the challenge to be tedious either.
=end