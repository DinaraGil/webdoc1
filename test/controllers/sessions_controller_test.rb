require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_session_path
    assert_response :success
  end

  test "should get create" do
    get new_session_path
    assert_response :success

    post session_path, params: { session: { email: "user@example.com", password: "password" } }
    assert_response :success
  end
end
