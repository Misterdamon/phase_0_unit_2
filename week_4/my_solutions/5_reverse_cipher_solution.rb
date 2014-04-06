# U2.W4: Refactor Cipher Solution


# I worked on this challenge by myself.


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence)
    alphabet = ('a'..'z').to_a #declares alphabet to be a range of characters from a-z, which is then converted into an array
    cipher = Hash[alphabet.zip(alphabet.rotate(4))] #rotate() shifts the values of the alphabets by 4 characters, and zip assigns each letter in the alphabet to a Hash key which contains the shifted alphabet letter as a value. i.e. a => e, g => k, etc...
    spaces = ["@", "#", "$", "%", "^", "&", "*"] #hardcodes characters that are correspond to spaces into an array
    
    original_sentence = sentence.downcase # converts original sentence to lower case
    encoded_sentence = [] #declares encoded sentence as an empty array
    original_sentence.each_char do |element| #iterates through each character from the original sentence
      if cipher.include?(element) #if the cipher Hash contains a key that corresponds to the original sentence element we are looking at--
        encoded_sentence << cipher[element] #push the corresponding coded value into the coded sentence array
      elsif element == ' ' #if the character in original sentence is a space--
        encoded_sentence << spaces.sample #insert a random symbol from the spaces array, i.e. one of @ # $ % ^ & or *
      else #if the cipher Hash doesn't contain the element and the character is not a space, then--
        encoded_sentence << element #push the element into the encoded sentence array, such as punctuation marks
      end
     end
    
    return encoded_sentence.join #joins the array of encoded characters into a string and returns it
end


# Questions:
# 1. What is the .to_a method doing?
=begin
  The .to_a method is converting a range of characters from a-z into an array. 
  The result is an array containing each letter of the alphabet
=end
# 2. How does the rotate method work? What does it work on?
=begin 
  The rotate method works by taking whatever array that it is called on and shifts its indices by the specified value.
  In this case, rotate shifts the letters of the alphabet by +4 which shifts each letter to the left by 4, and wraps those at the beginning of the array back to the end.
  So the calling alphabet.rotate(4) would produce %w[e f g h i j k l m n o p q r s t u v w x y z a b c d].
=end
# 3. What is `each_char` doing?
=begin
  The each_char method takes each character in the original sentence and passes it to the given block. 
  In this case the block is an if/else branch that determines how to encode each character.
=end
# 4. What does `sample` do?
=begin
  sample takes a random value from the array it is called on, in this case, sample is taking a random symbol @ # $ % ^ &  or * and inserting it 
  into the coded sentence in the place of a space. So each time there is a space, a random symbol is substituted for it.
=end
# 5. Are there any other methods you want to understand better?
=begin
  I would like to get to know the zip method a little better, while I understand that in this example it maps each Hash key to the corresponding hash value, I don't fully
  understand how it works at this point. 
=end 
# 6. Does this code look better or worse than your refactored solution
#    of the original cipher code? What's better? What's worse?
=begin
  I think this code looks way better than my refactored solution, particularly the method used to assign the hash key/values, my method of accomplishing that ended up being longer and less efficient.
  Also, the conditional branching was better accomplished in this solution than my own.
=end

# 7. Is this good code? What makes it good? What makes it bad?
=begin
  I feel that this is good code, because it is clear, concise, and uses many ruby methods that I didn't know existed yet. I liked how the alphabet/hash/space values are not all hard-coded, and this makes it easier to follow.
  I also think this code is rather self-explanatory, except for the zip method, which I found a bit hard to understand in relation to assigning the Hash keys/values
=end
# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
#No this code does not return the same thing every time, while the encoded alphabetical characters are the same, each space is represented by a random sample of a symbol from the spaces array, so it produces a different output each time. 
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")





# 5. Reflection 
=begin
  For this challenge, I understood what the majority of the code was doing and was able to explain it. It took me a while to understand how the cipher Hash was properly assigning
  its key/value pairs from the zip and rotate methods, but after playing around in irb with it for a while I began to comprehend it. I guess the only trouble I'm having is trying to figure out why
  the code that I write is so different from the code other people write. I constantly find myself implementing these really complicated methods only to find that ruby already has one specific to what 
  I'm trying to do, I guess it just takes practice and a deeper understanding of the full scope of ruby's built-in methods. I learned a lot in this challenge though, including a few new methods that I hadn't
  tried before, like sample, zip and rotate, and it was great to get some exposure to them. So far I'm pretty confident in the learning objectives and can't wait to start the week 5 challenges! I enjoyed this exercise greatly
  because I got to see someone else's code and got some new insight into how mine should ultimately function.
=end