require 'rubygems'
# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.2.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'haml', :version => '2.0.8'
  config.gem 'fastercsv'
  config.gem 'ruby-openid', :lib => 'openid', :version => '>=2.0.4'

  # Make Time.zone default to the specified zone, and make Active Record store time values
  # in the database in UTC, and return them converted to the specified local zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Comment line to use default local time.
  config.time_zone = 'UTC'

  # config.plugins = ['open_id_authentication', 'jrails', 'haml']
  config.action_controller.session = {
    :session_key => '_backseat_session',
    :secret      => 'ede201e848d759c21e2701838fe4165056b9c9145ab531b80ed19fde750f4243cc01742c9485c3601e500e733948ec089b35093b2f9deb2803d7b0cf3b3b42f2'
  }

end

ActionController::Base.asset_host = Proc.new { |source, request|
 "#{request.protocol}#{request.host_with_port}"
}