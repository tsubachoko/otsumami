require 'test_helper'

class FoodsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:tester)
    @food = items(:nuts)
  end

  test "should get index" do
    get foods_path
    assert_response :success
  end

  test "should get show" do
    get food_path(@food)
    assert_response :success
  end

  test "post food when logged in" do
    log_in_as(@user)
    get new_food_path
    assert_template 'foods/new'
    # 無効な投稿
    assert_no_difference 'Food.count' do
      post foods_path params: { food: { title: "", content: "", comment: "" } }
    end
    assert flash.any?
    assert_template 'foods/new'
    # 有効な投稿
    content = "content"
    assert_difference 'Food.count', 1 do
      post foods_path params: { food: { title: "title", content: content, comment: "comment" } }
    end
    assert flash.any?
    follow_redirect!
    assert_match content, response.body
  end

  test "new when not logged in" do
    get new_food_path
    assert_redirected_to login_path
  end

  test "create when not logged in" do
    assert_no_difference 'Food.count' do
      post foods_path params: { food: { title: "title", content: "content", comment: "comment" } }
    end
    assert_redirected_to login_path
  end

  test "destroy when logged in" do
    log_in_as(@user)
    assert_difference 'Food.count', -1 do
      delete food_path(@food)
    end
    assert_redirected_to root_path
  end

  test "destroy when not logged in" do
    assert_no_difference 'Food.count' do
      delete food_path(@food)
    end
    assert_redirected_to login_path
  end

  test "destroy when logged in with wrong user" do
    other_user = users(:tester2)
    log_in_as(other_user)
    assert_no_difference 'Food.count' do
      delete food_path(@food)
    end
    assert_redirected_to root_path
  end

end
