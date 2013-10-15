module LastFM
  class Artist < Result
    class << self
      def search(phrase)
        Query.search('artist.search', phrase)
      end
    end # class << self
  end # class Artist
end # module LastFM
