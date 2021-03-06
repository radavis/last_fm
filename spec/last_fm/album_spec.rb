require 'spec_helper'

describe LastFM::Album, :vcr do
  context 'searching' do
    it 'returns a list of relevant albums' do
      album_name = 'OK Computer'
      results = LastFM::Album.search(album_name)
      expect(results.size).to_not eql(0)
      expect(results.first).to be_kind_of(LastFM::Album)
      expect(results.first.name).to eql(album_name)
    end

    it 'returns an image for an album' do
      album_name = 'Pretty Hate Machine'
      results = LastFM::Album.search(album_name)
      expect(results.first.image).to include('.png')
    end
  end

  context 'release date' do
    it 'should be a date' do
      result = LastFM::Album.get_info('Tycho', 'Dive')
      expect(result.released).to be_kind_of(Date)
      expect(result.released).to eql(Date.parse('2012-04-03'))
    end

    it 'should be nil if not present' do
      result = LastFM::Album.get_info('x', 'y')
      expect(result.released).to be_nil
    end
  end

  context 'get info' do
    it 'gets a relevant result' do
      artist = 'Sugar'
      album = 'Copper Blue'
      result = LastFM::Album.get_info(artist, album)
      expect(result).to_not be_nil
      expect(result).to be_kind_of(LastFM::Album)
      expect(result.name).to eql(album)
      expect(result.tracks.count).to eql(10)
    end
  end
end
