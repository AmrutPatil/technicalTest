require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
  def self.login
    post authentication_login_path, params: { Email: 'email@some.com', Password: 'password' }, xhr: true
  end

  def self.logout
    post authentication_logout_path, xhr: true
  end
end
