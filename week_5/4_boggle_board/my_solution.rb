
# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge Sebastian Belmar

$boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Access multiple elements of a nested array

# Pseudocode:
# input row/column to access element in nested array
# boggle_board[row][column], this is the way to access a nested array

# Initial Solution
def create_word(board, *coords)
  coords.map { |coord| board[coord.first][coord.last]}.join("")
end

puts create_word($boggle_board, [2,1], [1,1], [1,2], [0,3])  #=> returns "code"  
puts create_word($boggle_board, [0,1], [0,2], [1,2])  #=> creates what california slang word? 
#This call create_word() returns the word, "rad"

# Refactored Solution
#We found this code to be clear, concise, and efficient, so we did not refactor it.

# DRIVER TESTS GO BELOW THIS LINE
p create_word($boggle_board, [0,0],[1,0],[3,2],[3,3]) == "bike"
p create_word($boggle_board, [1,1]) == 'o'
p $boggle_board != []

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode
# -- changed boggle_board to global variable because get_row() did not have access to it
# -- define get_row to take a single integer parameter
#  -return boggle_board row
# Raise Argument Error if argument is less than zero.

# Initial Solution
#def get_row(row)
#   $boggle_board[row]
#end

# Refactored Solution
#We did not refactor this solution because it is easy to understand and it is only one line of code
def get_row(row)
    raise ArgumentError.new("You put in a negative row") if row < 0
    $boggle_board[row]
end
    



# DRIVER TESTS GO BELOW THIS LINE
#tests to see if row is negative
begin
  get_row(-1)
rescue ArgumentError => err
  fail = err.message
end

p fail == "You put in a negative row"

p get_row(2) == ["e", "c", "l", "r"]


#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode:
# Define method get_col that takes a single integer parameter. 
# Return an array with all the elements of that column in order.
# Raise Argument Error if argument is less than zero.

# Initial Solution
#def get_col(col)
#    i = 0
#    result = []
#    while i < $boggle_board.length
#    result << $boggle_board[i][col]
#    i += 1
#    end
#    return result
#end


# Refactored Solution
def get_col(col)
   raise ArgumentError.new("You put in a negative column") if col < 0
   result= []
   $boggle_board.each_index {|x| result << $boggle_board[x][col]}
   result
end

# DRIVER TESTS GO BELOW THIS LINE
begin
  get_col(-1)
rescue ArgumentError => err
  fail = err.message
end
p fail == "You put in a negative column"
p get_col(2) == %w{a d l k}
p get_col(3) == %w{e t r e} 



# Reflection
=begin
  I found it very helpful to pair on this challenge because I always enjoy learning from other people and seeing new ways of doing things
  that I never would have thought of. Our strategy for this challenge was to go through each step and define pseudocode that would guide us
  toward the solution. It was nice to get some more experience with multidimensional arrays and the each iteration methods, as well as some more
  experience with exception handling and TDD. Overall, I feel comfortable with the learning objectives for this challenge and can't wait to learn more
  ruby methods. 
=end