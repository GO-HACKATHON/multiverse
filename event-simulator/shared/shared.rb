require 'optparse'
require 'rubygems'
# require 'aerospike'

module Shared

  attr_accessor :write_policy, :policy, :client, :logger, :config

  def init
    @@options = {
      :port => 3000,
      :namespace => 'test',
      :set => 'examples',
    }

    # opt_parser.parse!

    # @write_policy = WritePolicy.new
    # @policy = Policy.new
    @logger = Logger.new(STDOUT, Logger::INFO)
    # @client = host ? Client.new(Host.new(host, port)) : Client.new

  end

  def host
    @@options[:host] ||= '127.0.0.1'
  end

  def port
    @@options[:port]
  end

  def namespace
    @@options[:namespace]
  end

  def set_name
    @@options[:set]
  end

end
