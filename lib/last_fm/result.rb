module LastFM
  class Result
    attr_reader :id, :url, :name, :image, :images

    def initialize(attributes)
      @id = attributes['id']
      @url = attributes['url']
      @name = attributes['name']

      @images = {}
      attributes['image'].each do |image|
        @images[image['size'].to_sym] = image['#text']
      end
      @image = @images[:large]
    end
  end # class Result
end # module LastFM
