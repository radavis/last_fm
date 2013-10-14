# LastFm

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'last_fm'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install last_fm

## Usage

artist = LastFM::Artist.search('Nirvana').first
artist.name # 'Nirvana'
artist.image # 'http://userserve-ak.last.fm/serve/126s/416571.jpg'

album = LastRubyFm::Album.search('Purple')[1]
album.artist  # 'Stone Temple Pilots'
album.tracks # retrieves a list of LastRubyFm::Track objects for the given album

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
