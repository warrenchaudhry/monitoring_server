require 'test_helper'
class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.new(email: 'admin@xyz-email.com', password: 'password', password_confirmation: 'password')
    @user.save
  end

  test "login with valid information" do
    get new_user_session_path
    post user_session_path, params: { user: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'servers/index'
    assert_select "a[href=?]", servers_path
    assert_select "a[href=?]", destroy_user_session_path
  end
end
