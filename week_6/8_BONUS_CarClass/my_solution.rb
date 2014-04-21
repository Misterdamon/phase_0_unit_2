# U2.W6: Create a Car Class from User Stories


# I worked on this challenge by myself.


# 2. Pseudocode
=begin
	--define Pizza class
		-define attr_reader pizza_type
		-- define method initialize to take a string as type of pizza

	--define class Car
		-define attr_reader distance
	-- define method initialize to take model and color as string parameters.
		-set @model to model, set @color to color
	-- define method drive to take a speed and a distance
	  -set @speed to speed, and travel_distance to @travel_distance
	-- define method turn to take a string argument 'left' or 'right'
		- output which direction the car turned
	-- define method slow_down to take an integer parameter
		- set @speed to parameter
	-- define method get_speed
		- output current speed
	--define method pizza_box to take any number of instances of Pizza class
		- set @pizzas to array, and push parameters into array
	-- define method deliver_pizza to take the last pizza from @pizzas array and output which type it was.
	-- define method distance_traveled
		- output total distance traveled by car
	-- define method stop
		- set @speed to 0
=end
# 3. Initial Solution
class Pizza
		attr_reader :pizza_type

	def initialize(type)
		@pizza_type = type
	end

end

class Car
	attr_reader :distance_total

	def initialize(model, color)
		@model = model
		@color = color
		@distance_total = 0
	end

	def drive(speed, distance)
		@speed = speed
		@travel_distance = distance
		puts "You travel for #{@travel_distance} miles at #{@speed} mph."
		@distance_total += distance
	end

	def slow_down(new_speed)
		@speed = new_speed
		puts "You start to decelerate. Your speed is now #{new_speed} mph."
	end

	def turn(direction)
		puts "You turn #{direction} at the intersection. Don't let those pizzas slide around!"
	end

	def get_speed
		puts "You are travelling at #{@speed} mph."
		@speed
	end

	def total_distance
		puts "You have travelled a total of #{@distance_total} miles so far."
		@distance_total
	end

	def pizza_box(*pizzas)
		@pizzas = []
		pizzas.each {|p| @pizzas << p }
	end

	def deliver_pizza
		puts "You deliver a #{@pizzas.pop.pizza_type} pizza at your destination."
		puts "Your next delivery is for a #{@pizzas.last.pizza_type} pizza. Hurry up, before it gets cold!"
	end
end
# 4. Refactored Solution
#Most of my methods and class declarations were very simple, so I decided not to refactor. The only refactoring that I could do is to move the deliver pizza
#method to the Pizza class, but this wouldn't really change all that much in the overall layout of the program. 





# 1. DRIVER TESTS GO BELOW THIS LINE

tesla = Car.new("Tesla Roadster", "Red")
tesla.pizza_box(Pizza.new("Pepperoni"),Pizza.new("Supreme"),Pizza.new("Cheese"),Pizza.new("Meat Lovers"))
tesla.drive(25, 0.25)
tesla.slow_down(0)
tesla.turn('left')
tesla.drive(35, 1.5)
tesla.get_speed
tesla.slow_down(15)
tesla.drive(15, 0.25)
tesla.turn('left')
tesla.drive(35, 1.4)
tesla.slow_down(0)
tesla.deliver_pizza
tesla.total_distance

#case tests
p tesla.total_distance == 3.4
p tesla.get_speed == 0


# 5. Reflection
=begin 
	For this bonus challenge, I found it great to get some more practice with writing classes and working with more instance variables. I also loved getting more
	experience with writing driver code from user stories, that I would then write the methods from. Overall my strategy worked and I was able to get the program to function as
	expected. In addition to this, I got to see how a class might be used in a larger project, such as a video game. Overall, I enjoyed doing this challenge because I don't think I could ever
	learn TOO much about classes and how they work. I feel comfortable with the learning objectives as well, and can't wait for next week's assignments!
=end