require 'rspec/autorun'
require 'target_process'
require 'vcr'
require 'securerandom'

if ENV['COVERAGE']
  require 'simplecov'
  require 'simplecov-gem-adapter'
  SimpleCov.start 'gem'
end

unless ENV['TRAVIS']
  VCR.configure do |c|
    c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
    c.hook_into :webmock
    c.configure_rspec_metadata!
  end
end
