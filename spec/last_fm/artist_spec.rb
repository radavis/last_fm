require 'spec_helper'

describe LastFM::Artist do
  context 'searching' do
    it 'returns a list of relevant artists' do
      artist_name = 'Aphex Twin'
      results = LastFM::Artist.search(artist_name)
      expect(results.size).to_not eql(0)
      expect(results.first).to be_kind_of(LastFM::Artist)
      expect(results.first.name).to eql(artist_name)
    end
  end
end
