require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @setting = Setting.first
    if @setting.nil?
      @setting = Setting.create
    end
    @user = User.create(email: "admin-user@email.com", password: 'password', password_confirmation:'password')
    @user.save
  end

  test "should show settings" do
    sign_in(@user)
    get setting_url(@setting)
    assert_response :success
  end

  test "should get edit" do
    sign_in(@user)
    get edit_setting_url(@setting)
    assert_response :success
  end

  test "should update server" do
    sign_in(@user)
    patch setting_url(@setting), params: { setting: { cost_usage_limit: 40, disk_usage_limit: 49 } }
    assert_redirected_to setting_url(@setting, notice: 'Settings has been updated!')
  end

end
