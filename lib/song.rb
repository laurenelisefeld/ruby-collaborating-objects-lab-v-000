class Song
  attr_accessor :name, :song, :artist, :genre, :artist_name

  def initialize(name)
    @name = name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name) #creates/sets artist attribute to be the result of name passed to .find_or_create_by_name func
    artist.add_song(self) #invokes .add_song function passing in new self object as variable
  end

  def self.new_by_filename(file_name)
    song_array = file_name.split(" - ")
    song = self.new(song_array[1])
    song.artist_name = song_array[0]
    return song
  end
end 
