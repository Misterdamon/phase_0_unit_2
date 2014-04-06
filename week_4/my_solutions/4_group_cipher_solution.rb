# U2.W4: Cipher Challenge


# I worked on this challenge with Sam Davis.



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.


=begin
def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
  decoded_sentence = []
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c", 
            "h" => "d", 
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
            
  input.each do |x| # What is #each doing here?
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true?
    cipher.each_key do |y| # What is #each_key doing here?
      if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
        puts "I am comparing x and y. X is #{x} and Y is #{y}."
        decoded_sentence << cipher[y]
        found_match = true
        break  # Why is it breaking here?
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do?
        decoded_sentence << x
        found_match = true
        break
      end 
    end
    if not found_match  # What is this looking for?
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. 
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
  end  
  return decoded_sentence # What is this returning?  # What is this returning? It would be returning a string, due to the .join.           
end
=end

#Samuel Davis
#Jake Persing


# Your Refactored Solution
# defined an array "letters" from a to z
def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
  decoded_sentence = []
  letters = ("a".."z").to_a
  # defined a new array "rotated" that is a rotated version of letters
  rotated = letters.rotate(4)
  # declared an empty hash "cipher"
  cipher = {}
  # iterated through the array by the index and reassigned each hash key
  # to its corresponding shifted letter
  rotated.each_with_index {|v, i| cipher[v] = letters[i]}
  # If we changed it to 10 rotated letters, then it would be shifted 6 more letters to the right
  # rotated = letter.rotate(10)
  # the rest of the code would be the same
 input.each do |x| # What is #each doing here? Each is iterating through each value 
  # in the input so that it can compare it to each value in the cipher hash. 
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true? Serves as a check so we know if we found
    # any matches in the if and elsif checks. What happens when it's true? We found a match!
    cipher.each_key do |y| # What is #each_key doing here? # Iterating through each key in the hash "cipher".
      if x == y  # What is this comparing? It is comparing the input to the key in the cipher.
      #Where is it getting x? It gets x from input.each, x is the corresponding character 
      #in input. Where is it getting y? y is from cipher.each_key, and represents the key element from the cipher hash. What are those variables really? Those variables are placeholders for characters to compare.
        puts "I am comparing x and y. X is #{x} and Y is #{y}."
        decoded_sentence << cipher[y]
        found_match = true
        break  # Why is it breaking here?
        # it breaks so that the found_match flag can be evaluated and so that the other conditional branches are not compared
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing? 
        #This is comparing the input value to a variety of symbols, if x contains one of these symbols, push a space character into the decoded sentence.
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do?
        #This creates an array containing 10 numbers from 0-9
        decoded_sentence << x
        found_match = true
        break
      end 
    end
    if not found_match  # What is this looking for? This is looking checking to see if the found_match flag is false, if it is, then we push x into the decoded sentence.
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. 
    # this is a regular expression that looks for a match of an number of any length, and divides by 100 
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
  end  
  return decoded_sentence # What is this returning? It would be returning a string, due to the .join.           
end



# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.")
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!")
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.")
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!")
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?")

# Reflection
=begin
  In this group challenge, it took us a while to figure out how to refactor the cipher hash to be a simple algorithm, but we eventually got it right. Our strategy was to go through the code, 
  and pick out which areas could use improvement. I guess the only real question I had while working through this challenge was on the purpose of the found_match flag, and why it is necessary 
  in this case. I still get confused by the enumerable methods sometimes, especially the block portions, there seem to be so many methods that differ only slightly, so it is difficult to understand how they each
  work without researching the documentation for them. Overall I still feel comfortable with the learning objectives so far, but could definitely use as much practice as I can get. I found refactoring somehwat 
  tedious just because it is difficult for me to think of better code that can improve on the original without completely changing the program architecture. 
=end