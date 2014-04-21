# U2.W6: Create a BoggleBoard Class


# I worked on this challenge with: Sebastian Belmar.


# 2. Pseudocode
# Steps
=begin 
  --Define class BoggleBoard
  --Define initialize to take a multidimensional array
    - Raise an Error if parameter is nil
    - set @board = multidimensional array
  -- Define method create_word that takes a series of arrays(coordinates)
   - Use coodinates to create word and then join it to a string
  -- Define method get_row that takes a single integer as a parameter
   - Raise an Error if parameter is != to positive integer
   - Return a row at the index of the parameter
  -- Define get_col  that takes a single integer as a parameter
   - Raise an Error if parameter is != to positive integer
   - Return a column specified by the parameter
=end


# 3. Initial Solution
=begin
class BoggleBoard
  def initialize(board = nil)
    raise ArgumentError.new("Invalid Boggle Board") if board == nil
    @board = board
  end
  
  def create_word(*coords)
    coords.map { |x| 
    raise ArgumentError.new("Invalid Coordinate") if x.first < 0 || x.last < 0
    raise ArgumentError.new("Invalid Coordinate") if x.first > @board.length || x.last > @board[0].length
    @board[x.first][x.last]
    }.join('')
  end
  
  def get_row(row)
    raise ArgumentError.new("Invalid row index") if row < 0  || row > @board.length
    @board[row]
  end
  
  def get_col(col)
    raise ArgumentError.new("Invalid col index") if col < 0 || col > @board[0].length
    result = []
    @board.each_index { |x| result << @board[x][col] }
    result
  end
  
  def get_diagonal(start, finish)
    if start.first > finish.first #tests to see if the diagonal is going top-to-bottom or bottom-to-top
      a = start #if botttom-to-top, we reverse the coords
      b = finish 
      start = b
      finish = a
      rev = true
    end
    #assigned coord values to temp variables so we can manipulate them without changing the original coord
    x1 = start.first
    x2 = finish.first
    y1 = start.last
    y2 = finish.last
    result = ''
    raise ArgumentError.new("This is not a diagonal") if y1 == y2

    if y2 > y1 #tests to see if diagonal is right-to-left or left-to-right
      while x1 <= x2
        result += @board[x1][y1]
        x1 +=1
        y1 +=1 if y2 > y1
        y -= 1 if y2 < y1
      end
    else
      while x1 <= x2
        result += @board[x1][y1]
        x1 += 1
        y1 -= 1
      end 
    end
    return result.reverse if rev == true
    result
  end
  
  def show_words
    i = 0
    rows =[]
    cols = []
    while i < 4
      rows << self.get_col(i).join('')
      cols << self.get_row(i).join('')
      i += 1
    end
    puts "Rows: #{rows}"
    puts "Cols: #{cols}"    
  end
end
=end
 
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
#boggle_board = BoggleBoard.new(dice_grid)

# 4. Refactored Solution
class BoggleBoard
  def initialize(board = nil)
    raise ArgumentError.new("Invalid Boggle Board") if board == nil || !board.is_a?(Array)
    @board = board
  end
  
  def create_word(*coords)
    coords.map { |coord| 
    raise ArgumentError.new("Invalid Coordinate") if coord.first < 0 || coord.last < 0
    raise ArgumentError.new("Invalid Coordinate") if coord.first > @board.length || coord.last > @board[0].length
    @board[coord.first][coord.last]
    }.join('')
  end
  
  def get_row(row)
    raise ArgumentError.new("Invalid row index") if row < 0  || row > @board.length
    @board[row]
  end
  
  def get_col(col)
    raise ArgumentError.new("Invalid col index") if col < 0 || col > @board[0].length
    result = []
    @board.each_index { |row| result << @board[row][col] }
    result
  end
  
 def get_diagonal(start, finish)
    if start.first > finish.first #tests to see if the diagonal is going top-to-bottom or bottom-to-top
      a = [] 
      a << start << finish        #reverses coordinates if it going bottom-to-top
      start = a.last
      finish = a.first
      rev = true                  #sets reverse flag to true if start.first > finish.first
    end
    #assigned coord values to temp variables so we can manipulate them without changing the original coord
    x1 = start.first
    x2 = finish.first
    y1 = start.last
    y2 = finish.last
    result = ''
    raise ArgumentError.new("This is not a diagonal") if y1 == y2
 
    while x1 <= x2               #iterates through coords and adds character to result string
      result += @board[x1][y1]
      x1 +=1                     #increment x in every situation
      y2 > y1 ? y1 +=1 : y1 -= 1 #tests to see if diagonal is right-to-left or left-to-right
    end
    
    return result.reverse if rev == true
    result
  end
  
  def show_words #we created a method to print out each word that appears in each row and column
    i = 0
    rows =[]
    cols = []
    while i < 4
      rows << self.get_col(i).join('')
      cols << self.get_row(i).join('')
      i += 1
    end
    puts "Rows: #{rows}"
    puts "Cols: #{cols}"    
  end
end


# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:
boggle_board_2 = BoggleBoard.new(dice_grid)
p boggle_board_2.get_row(0) == %w{b r a e}           #test method get_row
p boggle_board_2.get_col(0) == %w{b i e t}           #test method get_col
p boggle_board_2.create_word([0,1],[1,1],[2,1],[3,2]) == "rock" #test picking words
boggle_board_2.show_words                            #print all rows and columns
p boggle_board_2.create_word([1,2], [1,1], [2,1], [3,2]) == "dock" #test picking words
p boggle_board_2.get_diagonal([0,0],[3,3]) == "bole" #test 4 letter diagonal t-b l-r
p boggle_board_2.get_diagonal([0,0],[1,1]) == "bo"   #test 2 letter diagonal t-b l-r
p boggle_board_2.get_diagonal([0,1],[2,3]) == "rdr"  #test 3 letter diagonal t-b l-r
p boggle_board_2.get_diagonal([0,3],[3,0]) == "edct" #test 4 letter diagonal t-b r-l
p boggle_board_2.get_diagonal([3,3],[0,0]) == "elob" #test 4 letter diagonal b-t l-r
p boggle_board_2.get_diagonal([3,0],[0,3]) == "tcde" #test 4 letter diagonal b-t r-l

begin
  boggle_board_2.get_row(8)                     #test bigger row
rescue ArgumentError
  p $!.to_s == "Invalid row index"
end

begin
  boggle_board_2.get_col(8)                     #test bigger col
rescue ArgumentError
  p $!.to_s == "Invalid col index"
end

begin 
  boggle_board_2.create_word([-1,-1])           #test invalid coordinate
rescue ArgumentError
  p $!.to_s == "Invalid Coordinate"
end

begin 
  boggle_board_2.create_word([1,1],[0,0],[8,1]) #test invalid coordinate on x
rescue ArgumentError
  p $!.to_s == "Invalid Coordinate"
end

begin 
  boggle_board_2.create_word([1,1],[0,0],[1,8]) #test invalid coordinate on y
rescue ArgumentError
  p $!.to_s == "Invalid Coordinate"
end


# 5. Reflection 
=begin
	I ended up pairing for this challenge, because it seemed like a good challenge to get more practice working with someone else. It took
	us longer than expected to complete the program, mainly because we added comprehensive tests and exception handling to make sure we had the correct
	inputs and to make sure the indices we were dealing with didn't go beyond the edge of the board. I think the hardest part of the challenge was the bonus that
	created words diagonally, because it required a more detailed process to determine which direction the words would be created in. We ended up creating a method that 
	accomplished all of requirements, but it took us a while to get our method to work with all of the possible inputs. Overall I feel comfortable with the learning objectives,
	and I would say that even though this program was more challenging than others, we learned a lot and didn't really find it tedious.
=end

