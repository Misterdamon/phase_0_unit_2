# U2.W4: Homework Cheater


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:
	#The input would be a title(string), topic(string),date(int), thesis(string), and pronoun(var)
# Output:
	#The program will return a string that uses all arguments and forms a sentence using them.
# Steps:
=begin 
	- define topics as Hashes, with key/value pairs: title:,topic:,date:,thesis:,pronoun, and lastname.
	-define essay_writer(title,topic,date,thesis_statement,pronoun)
		-- concatenate all arguments of essay_writer into the template
		--return concatenated string
=end

topic1 = {
	"title" => "Relatively General",
	"topic" => "Albert Einstein",
	"date" =>1915,
	"thesis"=> "His discoveries in general relativity were responsible for changing our view of how the universe works",
 "pronoun"=> "him",
 "lastname"=> "Einstein"
}

topic2 = {
	"title"=> "Morpheus, Herald of the end of the Matrix.",
	"topic"=> "Morpheus",
	"date"=> 1999,
	"thesis"=> "His main contribution to society was that he freed Neo from the Matrix which subsequently allowed all of us to escape our mental prisons designed by the machines",
	"pronoun" => "him",
	"lastname" => "Morpheus"
}

topic3 = {
	"title"=>"Chuck Norris, or should I say Carlos Ray.",
	"topic"=>"Chuck Norris",
	"date"=>1993,
	"thesis"=> "His main contribution to society was his role in Walker Texas Ranger, which reminds us all that roundhouse kicks are the solution to world peace",
	"pronoun"=> "him",
	"lastname"=>"Norris"
}

# 3. Initial Solution
=begin
def essay_writer(title,topic,date,thesis_statement,pronoun) 
	puts title + "\n" + topic + " was very influential in " + date.to_s + ". "	+ thesis_statement + ". I believe that without " + pronoun + ", society would be very different than it is now."
end

puts essay_writer(topic1["title"],topic1["topic"], topic1["date"], topic1["thesis"], topic1["pronoun"])
puts essay_writer(topic2["title"],topic2["topic"], topic2["date"], topic2["thesis"], topic2["pronoun"])
puts essay_writer(topic3["title"],topic3["topic"], topic3["date"], topic3["thesis"], topic3["pronoun"])
=end

# 4. Refactored Solution
# I refactored my solution to only use one Hash argument instead of 6 different arguments, this makes the implementation much easier because you don't need to type out each item when calling it, all you have to do is pass it the topic Hash.
def essay_writer(topic) 
	template = "----" + topic["title"] + "----" + "\n" + topic["topic"] + " was very influential in " + topic["date"].to_s + ". "	+ topic["thesis"] + ". I believe that without " + topic["pronoun"] + ", society would be very different than it is now. " + topic["lastname"] + " is a great person."
	template
end

puts essay_writer(topic1)
puts essay_writer(topic2)
puts essay_writer(topic3)





# 1. DRIVER TESTS GO BELOW THIS LINE
p topic1.is_a? Hash
p topic2.is_a? Hash
p topic3.is_a? Hash
p essay_writer(topic1).is_a? String
p essay_writer(topic3) == "----Chuck Norris, or should I say Carlos Ray.----
Chuck Norris was very influential in 1993. His main contribution to society was his role in Walker Texas Ranger, which reminds us all that roundhouse kicks are the solution to world peace. I believe that without him, society would be very different than it is now. Norris is a great person."
p essay_writer(topic1) == "----Relatively General----
Albert Einstein was very influential in 1915. His discoveries in general relativity were responsible for changing our view of how the universe works. I believe that without him, society would be very different than it is now. Einstein is a great person."
p essay_writer(topic2) == "----Morpheus, Herald of the end of the Matrix.----
Morpheus was very influential in 1999. His main contribution to society was that he freed Neo from the Matrix which subsequently allowed all of us to escape our mental prisons designed by the machines. I believe that without him, society would be very different than it is now. Morpheus is a great person."



# 5. Reflection 
=begin
	I felt that this challenge was harder to complete than other challenges because it was sort of hard to follow the instructions and user story. My process was so go through the user story and figure out which arguments needed to
	be passed to my essay_writer() function. I ended up storing all my topic values in Hashes so that I would be able to just pass one argument to the writer function and each topic value would be accessible inside the function, rather 
	than being passed to the function individually. For the most part, following my pseudocode was pretty easy since most of this challenge was variable declaration and manipulation. I guess the only question I had during this challenge was about 
	the structure of my code, it seems far too simple to be the right solution for this challenge, but it seems like I have satisfied all the requirements. So far I am comfortable with the learning objectives and am looking forward to completing the other
	challenges. I enjoyed this challenge because it gave me a chance to get some more practice with string manipulation and making tests for my code!
=end


