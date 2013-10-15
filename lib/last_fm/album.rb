module LastFM
  class Album < Result
    class << self
      def search(phrase)
        Query.search('album.search', phrase)
      end
    end # class << self
  end # class Album
end # module LastFM
