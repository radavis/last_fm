# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'last_fm/version'

Gem::Specification.new do |spec|
  spec.name          = "last_fm"
  spec.version       = LastFM::VERSION
  spec.authors       = ["Richard Davis"]
  spec.email         = ["rdavis.bacs@gmail.com"]
  spec.description   = %q{API Wrapper for last.fm}
  spec.summary       = %q{An API Wrapper for last.fm using Faraday, VCR, and RSpec}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "multi_json"

  #spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "pry"
end
