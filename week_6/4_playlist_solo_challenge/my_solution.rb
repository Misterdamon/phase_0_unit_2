# U2.W6: Create a Playlist from Driver Code


# I worked on this challenge by myself.


# Pseudocode
=begin
	-- define Playlist class
	-- define initialize to take any number of instances of Song class
		-- set @songs = songs
	-- define add to take any number of Song
		-- add each song in *songs parameter to @songs array
		-- output which track and artist we are adding
	-- define num_of_tracks
		- return @songs.length
	-- define remove to take a single Song
		- delete parameter from @songs array
	-- define includes? to take a single Song parameter
		- return true if @songs array contains song parameter, return false if it does not
	-- define play_all
		- loop through @songs array and output title and artist of each song playing
	-- define display
		- loop through each song in @songs array and output to console the title and artist

	-- define Song class
	-- define initialize tot take a title and artist as parameters
		-- set title to @title
		-- set artist to artist
	-- define play
		-- output title and artist of song playing to console
=end

# Initial Solution
=begin
class Playlist
	def initialize(*songs)
		@songs = songs
	end

	def add(*songs)
		songs.each {|x| 
			@songs << x
			puts "Adding #{x.title}, by #{x.artist}"
		}
	end

	def num_of_tracks
		@songs.length
	end

	def remove(song)
		@songs.delete(song)
	end

	def includes?(song)
		return true if @songs.include?(song)
		return false if not @songs.include?(song)
	end

	def play_all
		@songs.each {|track| puts "Playing #{track.title}, by #{track.artist}."}
	end

	def display
		puts "Songs in your playlist: "
		@songs.each {|track| puts "#{track.title}, by #{track.artist}."}
	end
end

class Song
	attr_reader :title
	attr_reader :artist

	def initialize(title,artist)
		@title = title
		@artist = artist
	end

	def play
		puts "Playing #{@title}, by #{@artist}"
	end
end

=end

# Refactored Solution
class Playlist
	def initialize(*songs)
		@songs = songs
		raise ArgumentError.new("Invalid song format.") if not @songs[0].instance_of?(Song) || @songs == nil

	end

	def add(*songs)
		songs.each { |song| #adds each song to @songs array
			raise ArgumentError.new("Please provide valid songs to add.") if not song.instance_of?(Song)
			@songs << song
			puts "Adding #{song.title}, by #{song.artist}"
		}
	end

	def num_of_tracks
		@songs.length #returns length of @songs array
	end

	def remove(song)
		raise ArgumentError.new("Please provide a valid song to remove") if not song.instance_of?(Song)
		@songs.delete(song) #deletes song from @songs array
	end

	def includes?(song)
		raise ArgumentError.new("Please provide a valid song to search for.") if not song.instance_of?(Song)
		@songs.include?(song) ? true : false #return true if @songs contains 'song', false if it does not
	end

	def play_all
		@songs.each {|track| puts "Playing #{track.title}, by #{track.artist}."} #outputs which song is being played to the console
	end

	def display #displays all songs in @songs array to console
		puts "Songs in your playlist: "
		@songs.each {|track| puts "#{track.title}, by #{track.artist}."}
	end
end

class Song
	attr_reader :title #added attr_readers to allow the playlist class to access the song artist and title
	attr_reader :artist

	def initialize(title,artist) #initializes song to take a title and artist
		@title = title
		@artist = artist
	end

	def play
		puts "Playing #{@title}, by #{@artist}" #shows the artist and title of the song
	end
end





# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
 
my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)
 
lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
wrecking_ball = Song.new("Wrecking Ball", "Mylie Cyrus")
my_playlist.add(lying_from_you, angels)
going_under.play
p my_playlist.num_of_tracks == 5 #should be true
my_playlist.remove(angels)
my_playlist.play_all
my_playlist.display
p my_playlist.includes?(lying_from_you) == true #should be true
p my_playlist.includes?(wrecking_ball) == false #should evaluate to true because wrecking ball is not in the @songs array

begin
	Playlist.new(1234)
rescue 
	puts $! 
end

begin
	Playlist.new(one_by_one, world_so_cold, going_under).remove('wrecking ball')
rescue
	puts $!
end

begin
	Playlist.new(one_by_one, world_so_cold, going_under).add('wrecking ball', wrecking_ball)
rescue
	puts $!
end

begin
	Playlist.new(one_by_one, world_so_cold, going_under).includes?('wrecking ball')
rescue
	puts $!
end

# Reflection
=begin 
	I know that we were only required to do one of the solo challenges this week, but I decided to do both just to get some more practice with writing classes and using instance
	variables and class methods. I also wanted to practice some more with TDD and EDD, because I still have some trouble writing comprehensive tests. My strategy was basically to run the code at first, and then
	go through each error and made changes to the class methods accordingly. Once I had all of the errors taken care of, I went through each method and satisfied the requirements so that the code would perform 
	as expected. Overall I feel comfortable with writing classes and doing TDD and EDD, and am excited for unit 3 curriculum to start! I didn't really find any part of this challenge to be tedious because it was 
	great practice as I went through it.
=end