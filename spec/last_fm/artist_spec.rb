require 'spec_helper'

describe LastFM::Artist, :vcr do
  context 'searching' do
    it 'returns a list of relevant artists' do
      artist_name = 'Aphex Twin'
      results = LastFM::Artist.search(artist_name)
      expect(results.size).to_not eql(0)
      expect(results.first).to be_kind_of(LastFM::Artist)
      expect(results.first.name).to eql(artist_name)
    end

    it 'returns an image for an artist' do
      artist_name = 'Nirvana'
      results = LastFM::Artist.search(artist_name)
      expect(results.first.images[:large]).to include('.jpg')
    end
  end
end
