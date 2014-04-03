# U2.W4: Create Accountability Group


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:
# The input for this function would be an array of strings (names) containing the names of all Fence Lizards
# Output:
# The output would be randomly assigned groups of 4 people, if the number of names is not divisible by 4, then groups of 5 will be assigned
# Steps:
=begin	
	 define create_group to take an array of strings
	  - assign groupSize to length of names array

	 	-- for index between 1..3 
	 	 - assign j to 1
	 	 - assign temp to shuffled names array
	 	 -output unit number based on i index
	 	 -- while length of temp > 0
	 	  - output group number based on j index
	 	  - increment j
	 	  - output last 4 values of temp array
	 	  -- if temp.length = 1/2/3 then output last 1/2/3 element(s) of temp array

	 	 - assign temp to shuffled names array
=end
# 3. Initial Solution
names = ["D. Kevin Kang", "Adam Dziuk", "Aki Suzuki", "Adam Ryssdal", "Dominick Oddo", "Eoin Mcmillan",
"Allison Wong", "Andra Lally", "Chris Aubuchon", "Hunter Chapman", "Jon Pabico", "Christiane Kammerl", 
"Clark Hinchcliff", "Devin Johnson", "Parjam Davoody", "Mary (Molly) Huerster", "Sebastian Belmar", "Eiko Seino",
 "Samuel Davis", "Jacob Persing", "Anup Pradham", "Yuzu Saijo", "Shawn Seibert", "William Bushyhead"]

=begin	

def create_group(names_array)
	groupSize = names_array.length
	
	for i in 1..3	do
		j = 1
		temp = names_array.shuffle
		puts "<<<Unit " + i.to_s + " Groups>>>"
		
			while temp.length > 0 
			puts "Group " + j.to_s + ": " + "\n"
			j = j + 1
			puts temp.pop(4)
				if temp.length == 1
					puts temp.pop
				elsif temp.length == 2
					puts temp.pop(2)
				elsif temp.length == 3
					puts temp.pop(3)
				end
  		end	
		temp = names_array.shuffle
 end
end

create_group(names)
=end

# 4. Refactored Solution
def create_group(names_array)
	groupSize = names_array.length
	remainder = groupSize % 4
	
	for i in 1..3	do #repeat shuffle and grouping for three units
		j = 1 #group number counter
		tempArray = names_array.shuffle #assign names_array to temp so the original array is not altered
		puts "<<<Unit " + i.to_s + " Groups>>>" 
			while tempArray.length > 0 
				puts "Group " + j.to_s + ": " + "\n"
				j = j + 1
			 	puts tempArray.pop(4)
					
					if tempArray.length == remainder #if the remaining length in temp is the same as the remainder length, then put the remaining members into the last group in the unit.
						puts tempArray.pop(remainder)
					end #end if
				puts "----------------" #adds more visual separation between groups and units
  		end	# end while
		tempArray = names_array.shuffle #reassign temp to names_array so that next unit groups can be output
  end #end for
  return names_array #returns original array to see if it has been altered
end #end create_group

create_group(names)


# 1. DRIVER TESTS GO BELOW THIS LINE
# It was hard to write tests for my method because the output was unique each time the program is run, and I wouldn't be able to check individual parts of my
# program without using rpsec tests. 

 p names.is_a? Array #checks to see if input is an array
 p create_group(names).is_a? Array #checks to see if return val is array
 p create_group(names)== names #checks to see if the original array has be altered



# 5. Reflection 
=begin
	I found this challenge to be much more challenging than anything else that we have done with Ruby so far, mainly because the instructions were more cryptic this time
	and because we had to create our own tests. I wasn't sure whether to output the resultant groups to the console, or to save each unit's groups in separate arrays. I ultimately
	decided to output the groups to the console because it seems like it made the most practical sense. In general my pseudocode was easy to follow and made writing the program easier
	to do, but I still found myself having to go back and change my pseudocode when I encountered a problem. I feel that writing the tests for this challenge was the most difficult part, mainly
	because my code returned a unique output each time it is run. I learned alot about using loops/nested loops in this challenge, which definitely reinforced my previous knowledge of them.
	So far I feel confident with most of the learning objectives, but definitely could use some more practice writing tests and for my code. Other than that, I enjoyed this program because it was
	more of a challenge than previous weeks, and I learned a lot more about loops and how they work. The only part of the program that I found tedious was writing the tests, mainly because there really wasn't
	much that I could actually test.
=end


