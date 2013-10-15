module LastFM
  class Query
    class << self
      def retrieve_from_api(args={})
        response = connection.get('/2.0/', {
          api_key: LastFM.api_key,
          format: 'json'
        }.merge(args))

        parsed_results = JSON.parse(response.body)
      end

      def search(args={})
        type = args[:method].split('.').first.downcase
        parsed_results = retrieve_from_api(args)
        type_matches = type + 'matches'

        if parsed_results['results'] && parsed_results['results'][type_matches]
          parsed_results['results'][type_matches][type].map do |attributes|
            LastFM.const_get(type.capitalize).new(attributes)
          end
        else
          []
        end
      end

      # Query.get_info('album.get_info', artist, album)
      def get_info(args={})
        parsed_results = retrieve_from_api(args)
        if parsed_results['album']
          Album.new(parsed_results['album'])
        else
          nil
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
  end # class Query
end # module LastFM
