require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:tester)
  end

  test "login with valid information" do
    get login_path
    assert_response :success
    post login_path, params: { session: { email: @user.email, password: "password" } }
    assert is_logged_in?
    follow_redirect!
    assert_template 'items/index'
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", new_drink_path
    assert_select "a[href=?]", new_food_path
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", new_user_path, count: 0
  end

  test "login with invalid password" do
    post login_path, params: { session: { email: @user.email, password: "invalid" } }
    assert_not is_logged_in?
    assert flash.any?
    assert_template 'sessions/new'
    get root_path
    assert flash.empty?
    assert_select "a[href=?]", user_path(@user), count: 0
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", new_drink_path, count: 0
    assert_select "a[href=?]", new_food_path, count: 0
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", new_user_path
  end


  test "logout should be successful" do
    log_in_as(@user)
    assert is_logged_in?

    delete logout_path
    assert_not is_logged_in?
    follow_redirect!
    assert flash.any?
    assert_template 'items/index'
  end

end
