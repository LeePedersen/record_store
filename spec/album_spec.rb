require('album')
require('rspec')



describe('.#Album') do

  before(:each) do
    @album1 = Album.new("Blue", 1979, "Modern Jazz", "Frank Zappa", nil)
    @album2 = Album.new("Red", 2001, "Minimal Garden Wave", "Davis Bowie", nil)
    @album1.save
    @album2.save
  end

  after(:each) do
    Album.clear
  end

  describe('#==') do
    it("is the same album if it has the same attributes") do
      album3 = Album.new("Blue", 1979, "Modern Jazz", "Frank Zappa", nil)
      expect(@album1).to(eq(album3))
    end
  end


  describe('#save') do
    it ("saves an album") do
      expect(Album.all).to(eq([@album1, @album2]))
    end
  end

  describe(".clear") do
    it("clears all albums") do
      Album.clear
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      expect(Album.find(@album1.id)).to(eq(@album1))
    end
  end

  describe('.find_by_name') do
    it("finds an album by name") do
      expect(Album.find_by_name("Blue")).to(eq(@album1))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      @album1.update("Yellow", 1995, "Ambient Grunge Step", " LP Flex")
      expect(@album1.name).to(eq('Yellow'))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      @album1.delete()
      expect(Album.all).to(eq([@album2]))
    end
  end

end
