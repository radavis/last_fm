module LastFM
  class Query
    class << self
      def search(method, phrase, format='json')
        type = method.split('.').first.downcase
        response = connection.get('/2.0/', {
          method: method,
          type.to_sym => phrase,
          api_key: LastFM.api_key,
          format: format
        })

        parsed_results = JSON.parse(response.body)
        type_matches = type + 'matches'

        if parsed_results['results'] && parsed_results['results'][type_matches]
          parsed_results['results'][type_matches][type].map do |attributes|
            LastFM.const_get(type.capitalize).new(attributes)
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
  end # class Query
end # module LastFM
