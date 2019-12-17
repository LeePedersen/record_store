class Album

  @@albums = {}
  @@total_rows = 0

  attr_reader :id, :name, :artist, :genre, :year

  def initialize(name, year, genre, artist, id)
    @name = name
    @year = year
    @genre = genre
    @artist = artist
    @id = id || @@total_rows += 1
  end

  def self.all()
    @@albums.values
  end

  def save()
    @@albums[self.id] = Album.new(self.name, self.year, self.genre, self.artist, self.id)
  end

  def ==(other_album)
    self.name.eql?(other_album.name) && self.artist.eql?(other_album.artist)
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def self.find_by_name(name)
    x = 1
    while x < @@albums.length
      if @@albums[x].name == name
        return @@albums[x]
      else
        "no match"
      end
      x = x + 1
    end
  end

  def update(name, artist, genre, year)
    @name = name
    @artist = artist
    @genre = genre
    @year = year
  end

  def delete
    @@albums.delete(self.id)
  end

end
