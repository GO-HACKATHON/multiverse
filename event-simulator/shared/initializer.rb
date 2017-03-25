require 'optparse'
require 'rubygems'
require 'active_support/all'
require 'yaml'

Dir["./app/*.rb"].each { |f| require f }
Dir["./app/*/*.rb"].each { |f| require f }

CONFIG = HashWithIndifferentAccess.new(
  YAML.load(ERB.new(IO.read("./shared/config.yml")).result)
)['development']

def init
  # do other initializer here
end

init
