require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:tester)
  end

  test "should get show" do
    get user_path(@user)
    assert_response :success
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "valid signup information " do
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "exmaple_user",
                                         email: "example@example.org",
                                         password: "password",
                                         password_confirmation: "password" } }
    end
    assert flash.any?
    follow_redirect!
    assert_template 'items/index'
    assert is_logged_in?
  end

  test "invalid signup information " do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "example.org",
                                         password: "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

end
