module LastFM
  class Track
    attr_reader :name, :duration, :mbid, :url

    def initialize(name, duration, mbid, url)
      @name = name
      @duration = duration
      @mbid = mbid
      @url = url
    end
  end
end
