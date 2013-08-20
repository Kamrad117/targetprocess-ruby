require 'rspec/autorun'

if ENV['COVERAGE']
  require 'simplecov'
  require 'simplecov-gem-adapter'
  SimpleCov.start 'gem'
end

require 'target_process'
require 'vcr'

unless ENV['TRAVIS']
  VCR.configure do |c|
    c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
    c.hook_into :webmock # or :fakeweb
    c.configure_rspec_metadata!
  end
end
