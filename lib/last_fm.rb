require "last_fm/version"
require "last_fm/artist"

module LastFM
  def self.api_key=(key)
    @api_key = key
  end

  def self.api_key
    @api_key
  end
end
