module LastFM
  class Album < Result
    attr_reader :mbid, :artist, :released, :tracks

    def initialize(attributes)
      super(attributes)

      @mbid = attributes['mbid'] if attributes['mbid']
      @artist = attributes['artist'] if attributes['artist']


      if attributes['releasedate'] and attributes['releasedate'].gsub(/\s+/, '').length > 0
        @released = Date.parse(attributes['releasedate'])
      end

      @tracks = []
      if attributes['tracks'] and attributes['tracks']['track']
        attributes['tracks']['track'].each do |track|
          @tracks << Track.new(track['name'], track['duration'], track['mbid'], track['url'])
        end
      end
    end

    class << self
      def search(album)
        Query.search({ method: 'album.search', album: album })
      end

      def get_info(artist, album)
        Query.get_info({ method: 'album.getInfo', artist: artist, album: album })
      end
    end # class << self
  end # class Album
end # module LastFM
