require 'test_helper'

class ServersControllerTest < ActionDispatch::IntegrationTest
  fixtures :servers
  setup do
    @server = Server.new(name: 'Testing Server', host: "http://192.168.254.254", description: 'Test Description')
    @server.save
    @server.reload
  end

  test "should get index" do
    get servers_url
    assert_response :success
  end

  test "should get new" do
    get new_server_url
    assert_response :success
  end

  test "should create server" do
    assert_difference('Server.count') do
      post servers_url, params: { server: { host: "192.168.254.100", name: "New Server", port: @server.port } }
    end

    assert_redirected_to server_url(Server.last)
  end

  test "should show server" do
    get server_url(@server)
    assert_response :success
  end

  test "should get edit" do
    get edit_server_url(@server)
    assert_response :success
  end

  test "should update server" do
    patch server_url(@server), params: { server: { auth_token: @server.auth_token, host: @server.host, name: @server.name, port: @server.port } }
    assert_redirected_to server_url(@server)
  end

  test "should destroy server" do
    assert_difference('Server.count', -1) do
      delete server_url(@server)
    end

    assert_redirected_to servers_url
  end
end
