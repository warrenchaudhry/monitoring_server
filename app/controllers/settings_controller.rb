class SettingsController < ApplicationController
  before_action :set_settings, only: [:show, :edit, :update]
  def show
  end

  def edit
  end

  def update
    @settings.last_updated_by = current_user.id
    if @settings.update_attributes(settings_params)
      redirect_to setting_path(@settings, notice: 'Settings has been updated!')
    else
      render :edit
    end

  end

  private
  def set_settings
    @settings = Setting.first
  end

  def settings_params
    params.require(:setting).permit(:cpu_usage_limit, :disk_usage_limit)
  end
end
