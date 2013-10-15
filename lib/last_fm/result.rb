module LastFM
  class Result
    attr_reader :name, :image, :images

    def initialize(attributes)
      @name = attributes['name']

      @images = {}
      attributes['image'].each do |image|
        @images[image['size'].to_sym] = image['#text']
      end
      @image = @images[:large]
    end
  end # class Result
end # module LastFM
