require 'faraday'
require 'json'

require "last_fm/version"
require "last_fm/query"
require "last_fm/result"
require "last_fm/artist"
require "last_fm/album"
require "last_fm/track"

module LastFM
  def self.api_key=(key)
    @api_key = key
  end

  def self.api_key
    @api_key
  end
end
