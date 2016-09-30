module Api
  module V1
    class BaseController < ActionController::Base
      include Api::Exceptions
      include Api::ErrorResponse
      protect_from_forgery with: :null_session
      skip_before_action  :verify_authenticity_token

    end
  end
end
