class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :settings
  def settings
    @settings = Setting.first
    unless @settings
      @settings = Setting.create
    end
    @settings
  end
end
