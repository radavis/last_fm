require 'faraday'
require 'json'
require 'pry'

module LastFM
  class Artist
    attr_reader :name, :image, :images

    def initialize(attributes)
      @name = attributes['name']

      @images = {}
      attributes['image'].each do |image|
        @images[image['size'].to_sym] = image['#text']
      end
      @image = @images[:mega]
    end

    class << self
      def search(phrase)
        response = connection.get('/2.0/', {
          method: 'artist.search',
          artist: phrase,
          api_key: LastFM.api_key,
          format: 'json'
          })

        parsed_results = JSON.parse(response.body)
        if parsed_results['results'] && parsed_results['results']['artistmatches']
          parsed_results['results']['artistmatches']['artist'].map do |artist_attributes|
            new(artist_attributes)
          end
        else
          []
        end
      end

      protected
      def connection
        conn ||= Faraday.new(url: 'http://ws.audioscrobbler.com') do |faraday|
          faraday.request :url_encoded
          faraday.adapter Faraday.default_adapter
        end
      end

    end # class << self
  end # class Artist
end # module LastFM
