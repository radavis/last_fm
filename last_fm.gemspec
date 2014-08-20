# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'last_fm/version'

Gem::Specification.new do |spec|
  spec.name          = "radavis_last_fm"
  spec.version       = LastFM::VERSION
  spec.authors       = ["Richard Davis"]
  spec.email         = ["rdavis.bacs@gmail.com"]
  spec.description   = %q{API Wrapper for last.fm}
  spec.summary       = %q{An API Wrapper for last.fm using Faraday, VCR, and RSpec}
  spec.homepage      = "http://www.github.com/radavis/last_fm"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "0.9.0"
  spec.add_dependency "multi_json", "1.10.1"

  spec.add_development_dependency "bundler", "1.6.2"
  spec.add_development_dependency "rake", "10.3.2"
  spec.add_development_dependency "rspec", "3.0.0"
  spec.add_development_dependency "webmock", "1.18.0"
  spec.add_development_dependency "vcr", "2.9.2"
  spec.add_development_dependency "pry", "0.10.1"
end
