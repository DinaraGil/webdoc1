require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "John Doe", email: "john@example.com", password: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "should save valid user" do
    assert @user.save
  end

  test "should authenticate user with correct password" do
    assert @user.authenticate("password")
  end

  test "should not authenticate user with incorrect password" do
    assert_not @user.authenticate("incorrect_password")
  end
end