ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  #Returns true if a test user is logged in.
  def is_logged_in?
    !session[:hungrybee_id].nil?
  end

  # Logs in a tes user.
  def log_in_as(hungrybee, options = {})
    password = options[:password]  || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post hungrybee_login_path, session: {phone_number: hungrybee.phone_number,
                                password: password,
                                remember_me: remember_me}
    else
      session[:hungrybee_id]  = hungrybee.id
    end
  end

  private

    # Returns true inside an integration test.
    def integration_test?
      defined?(post_via_redirect)
    end
end
