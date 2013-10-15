module LastFM
  class Album < Result
    attr_reader :mbid, :released, :tracks, :attributes

    def initialize(attributes)
      @attributes = attributes
      super(attributes)

      @mbid = attributes['mbid'] if attributes['mbid']
      @released = attributes['releasedate'] if attributes['releasedate']

      @tracks = []
      if attributes['tracks']
        attributes['tracks']['track'].each do |track|
          @tracks << Track.new(track['name'], track['duration'], track['mbid'], track['url'])
        end
      end
    end

    class << self
      def search(phrase)
        Query.search('album.search', phrase)
      end

      def get_info(artist, album)
        Query.get_info('album.getInfo', artist, album)
      end
    end # class << self
  end # class Album

  class Track
    attr_reader :name, :duration, :mbid, :url

    def initialize(name, duration, mbid, url)
      @name = name
      @duration = duration
      @mbid = mbid
      @url = url
    end
  end
end # module LastFM
