ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class Test::Unit::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false    
end

def_matcher :error_on do |receiver, matcher, args|
  receiver.valid?
  message = receiver.errors.on(args[0])
  expected = args[1]
  matcher.positive_msg = "Did not error on #{expected}. Errors: #{message}"
  !message.nil? && message.include?(expected)
end
