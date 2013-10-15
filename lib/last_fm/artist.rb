module LastFM
  class Artist < Result
    class << self
      def search(artist)
        Query.search({ method: 'artist.search', artist: artist })
      end
    end # class << self
  end # class Artist
end # module LastFM
