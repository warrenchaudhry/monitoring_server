require 'test_helper'

class ServersControllerTest < ActionDispatch::IntegrationTest
  fixtures :servers
  setup do
    @server = Server.new(name: 'Testing Server', host: "http://192.168.254.254", description: 'Test Description')
    @server.save
    @server.reload
    @user = User.create(email: "admin-user@email.com", password: 'password', password_confirmation:'password')
    @user.save
  end

  test "should get index" do
    sign_in(@user)
    get servers_url
    assert_response :success
  end

  test "should get new" do
    sign_in(@user)
    get new_server_url
    assert_response :success
  end

  test "should create server" do
    sign_in(@user)
    assert_difference('Server.count') do
      post servers_url, params: { server: { host: "192.168.254.100", name: "New Server", port: @server.port } }
    end

    assert_redirected_to server_url(Server.last)
  end

  test "should show server" do
    sign_in(@user)
    get server_url(@server)
    assert_response :success
  end

  test "should get edit" do
    sign_in(@user)
    get edit_server_url(@server)
    assert_response :success
  end

  test "should update server" do
    sign_in(@user)
    patch server_url(@server), params: { server: { auth_token: @server.auth_token, host: @server.host, name: @server.name, port: @server.port } }
    assert_redirected_to server_url(@server)
  end

  test "should destroy server" do
    sign_in(@user)
    assert_difference('Server.count', -1) do
      delete server_url(@server)
    end

    assert_redirected_to servers_url
  end
end
