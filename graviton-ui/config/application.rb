require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GravitonUi
  class Application < Rails::Application
  end

  def self.redis
    return Redis.new(CONFIG[:redis])
  end
  
  def self.aerospike
    return Aerospike::Client.new(CONFIG[:aerospike][:host])
  end
  
end
