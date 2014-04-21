# U2.W6: Drawer Debugger


# I worked on this challenge by myself.


# 2. Original Code

class Drawer

attr_reader :contents

# Are there any more methods needed in this class?

def initialize
	@contents = []
	@open = true
end

def open
	puts "Opening drawer"
	@open = true
end

def close
	puts "Closing drawer"
	@open = false
end 

def add_item(item)
	@contents << item
	puts "adding " + item.type
end

def remove_item(item = @contents.pop) #what is `#pop` doing? Pop is setting 'item' to the last value in the contents array
	puts "removing " + item.type
	@contents.delete(item)
end

def dump  # what should this method return?	this method should return @contents as an empty array
	puts "Dumping out the drawer!"
	return @contents = []
end

def view_contents
	puts "The drawer contains:"
	if(@contents == [])
		puts "Nothing"
	else
		@contents.each {|silverware| puts "- " + silverware.type }
	end
end

end #added missing end statement to class

class Silverware
attr_reader :type
attr_reader :clean

# Are there any more methods needed in this class? We need to write the clean method, that will change @clean to true after eat sets it so false

	def initialize(type, clean = true)
		@type = type
		@clean = clean
	end

	def eat
		puts "eating with the #{@type}"
		@clean = false
	end

	def clean
		@clean = true
		puts "Cleaning #{type}...Your #{type} is clean."
	end
end

def assert
	raise "Test Failed" unless yield
end

#method calls start here
silverware_drawer = Drawer.new
silverware_drawer.open

knife1 = Silverware.new("knife")
fork1 = Silverware.new("fork") #new fork
fork2 = Silverware.new("fork") #created new fork
spork1 = Silverware.new("spork")# new spork!
chopsticks1 = Silverware.new("chopsticks") #new chopsticks


silverware_drawer.add_item(knife1) #adds knife1
silverware_drawer.add_item(Silverware.new("spoon")) #adds spoon
silverware_drawer.add_item(fork1) #added new fork
silverware_drawer.add_item(spork1)# added spork
silverware_drawer.add_item(chopsticks1)#added chopsticks
silverware_drawer.remove_item(spork1)#removes spork

silverware_drawer.remove_item #removes chopsticks because no argument is given
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife) #adds sharp_knife

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife) #removes sharp_knife
removed_knife.eat #eating with sharp_knife
removed_knife.clean #cleaning sharp_knife

silverware_drawer.view_contents
silverware_drawer.dump #dumping out drawer
silverware_drawer.view_contents #What should this return? this outputs the @contents of silverware_drawer to the console.


silverware_drawer.add_item(fork2)
removed_fork = silverware_drawer.remove_item(fork2)

silverware_drawer.view_contents #add some puts statements to help you trace through the code...
removed_fork.eat
silverware_drawer.view_contents


#BONUS SECTION
removed_fork.clean #Added clean method to Silverware class so this call will work correctly.
silverware_drawer.add_item(removed_fork)

silverware_drawer.view_contents
silverware_drawer.close


# DRIVER TESTS GO BELOW THIS LINE
puts "Driver Test Outputs:"
assert{fork1.type == "fork"}
assert{fork2.type == "fork"}
assert{knife1.type == "knife"}
assert{fork1.instance_variable_get(:@clean) == true}
removed_fork.eat
assert{removed_fork.instance_variable_get(:@clean) == false}
assert{Drawer.new.dump == []}



# 5. Reflection
=begin 
	For this challenge it was great to get some more practice with debugging code and using more TDD practices. Also, it was great to work with all these different method calls
	because you get to see exactly how the program functions as it goes through each line, which helped to reinforce my knowledge of how program execution is done. It was somewhat difficult
	to write comprehensive assert tests for this program, but I think next challenge I'm going to try to write my own rspec tests so that they are more detailed. It was also great to get more practice with
	classes and using instance variables and attr_reader keyword, which I had never used before. Overall I feel comfortable with the learning objectives so far, and am getting more and more excited to start 
	the on-site program! I didn't really find this program tedious, other than writing the test code and adding some more of the method calls.
=end