require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_path
    assert_response :success
    assert assigns(:user).new_record?
  end

  test "should create user with valid params" do
    assert_difference('User.count') do
      post users_path, params: { user: { name: 'John Doe', email: 'john@example.com', password: 'password' } }
    end

    assert_redirected_to root_path
    assert_equal 'Вы зарегистрированы', flash[:notice]
  end

  test "should not create user with invalid params" do
    assert_no_difference('User.count') do
      post users_path, params: { user: { name: '', email: '', password: '' } }
    end

    assert_template :new
    assert_equal 'Вы неправильно заполнили поля формы регистрации', flash.now[:alert]
  end
end
