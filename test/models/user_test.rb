require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "user@example.com", password: 'password' , password_confirmation: 'password')
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should be invalid without email" do
    @user.email = nil
    @user.save
    assert_not @user.valid?
  end

  test "email validation should access valid addresses" do
    @user.email = "sample@email.com"
    @user.save
    assert @user.valid?
  end

  test "email validation should reject invalid addresses" do
    @user.email = "sampleemail.com"
    @user.save
    assert_not @user.valid?
  end

  test "should be invalid without password" do
    @user.password = nil
    @user.save
    assert_not @user.valid?
  end

end
