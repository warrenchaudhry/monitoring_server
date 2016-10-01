require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  def setup
    @setting = Setting.create(cpu_usage_limit: 70, disk_usage_limit: 80)
  end

  test "should be valid" do
    assert @setting.valid?
  end

  test "should be invalid without cpu_usage_limit" do
    @setting.cpu_usage_limit = nil
    @setting.save
    assert_not @setting.valid?
  end

  test "cpu usage limit should not be less than 1" do
    @setting.cpu_usage_limit = 0
    @setting.save
    assert_not @setting.valid?
  end

  test "cpu usage limit should not be greater than 100" do
    @setting.cpu_usage_limit = 123
    @setting.save
    assert_not @setting.valid?
  end

  test "should be invalid without disk_usage_limit" do
    @setting.disk_usage_limit = nil
    @setting.save
    assert_not @setting.valid?
  end

  test "disk usage limit should not be less than 1" do
    @setting.disk_usage_limit = 0
    @setting.save
    assert_not @setting.valid?
  end

  test "disk usage limit should not be greater than 100" do
    @setting.disk_usage_limit = 123
    @setting.save
    assert_not @setting.valid?
  end

end
