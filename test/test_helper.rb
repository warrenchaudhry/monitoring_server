ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/mini_test'

class ActionController::TestCase
  include Devise::Test::ControllerHelpers
end

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
  def is_logged_in?
    !session["warden.user.user.key"][1][0].nil?
  end

  def sign_in(user)
    get new_user_session_path
    post user_session_path, params: { user: { email:    @user.email,
                                          password: @user.password } }
  end
  ActiveRecord::Migration.check_pending!
  # DatabaseCleaner.strategy = :truncation
  # DatabaseCleaner.logger = Rails.logger
  # setup { DatabaseCleaner.start }
  # teardown { DatabaseCleaner.clean }
end
