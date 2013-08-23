require 'target_process/version'
require 'target_process/configuration'
require 'target_process/api_error'
require 'target_process/api_client'
require 'target_process/base'
Dir["./lib/target_process/entities/*.rb"].each { |file| require file }

module TargetProcess
  class ConfigurationError < StandardError; end

  def self.configuration
    msg = 'TargetProcess is not configured yet'
    @configuration || raise(TargetProcess::ConfigurationError.new(msg))
  end

  def self.client
    @client ||= APIClient.new
  end

  def self.configure
    @configuration ||= Configuration.new
    yield(@configuration)
  end

  def self.context(options = {})
    options.each { |item| item.to_s.slice(1..-2) if item.is_a?(Array) }
    TargetProcess.client.get('context/', options)
  end
end
