require 'test_helper'

class ServerTest < ActiveSupport::TestCase
  fixtures :servers
  setup do
    @server = Server.new(name: 'My Server', host: 'http://server.com', description: 'Test Description')
  end

  test "should save server with valid parameters" do
    assert @server.save
  end

  test "should not save without name" do
    @server.name = nil
    assert_not @server.save
  end

  test "should not save without host" do
    @server.name = 'New Host'
    @server.host = nil
    assert_not @server.save
  end

  test "should generate_auth_token" do
    @server.save
    assert @server.auth_token.present?
  end

  test "should add protocol to host without http or https" do
    host = "samplehost.com"
    @server.host = host
    @server.save
    assert_not_equal(host, @server.host)
  end

end
