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
    load_api_key_from_env if not has_key?
    @api_key
  end

  def self.has_key?
    !@api_key.nil? and @api_key != ''
  end

  def self.load_api_key_from_env
    @api_key = ENV['lastfm_api_key']
    if not has_key?
      raise "API key not found! Try 'export lastfm_api_key=YOUR_KEY'"
    end
  end
end
