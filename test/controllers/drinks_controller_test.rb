require 'test_helper'

class DrinksControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:tester)
    @drink = items(:beer)
  end

  test "should get index" do
    get drinks_path
    assert_response :success
  end

  test "should get show" do
    get drink_path(@drink)
    assert_response :success
  end

  test "post drink when logged in" do
    log_in_as(@user)
    get new_drink_path
    assert_template 'drinks/new'
    # 無効な投稿
    assert_no_difference 'Drink.count' do
      post drinks_path params: { drink: { title: "", content: "", comment: "" } }
    end
    assert flash.any?
    assert_template 'drinks/new'
    # 有効な投稿
    content = "content"
    assert_difference 'Drink.count', 1 do
      post drinks_path params: { drink: { title: "title", content: content, comment: "comment" } }
    end
    assert flash.any?
    follow_redirect!
    assert_match content, response.body
  end

  test "new when not logged in" do
    get new_drink_path
    assert_redirected_to login_path
  end

  test "create when not logged in" do
    assert_no_difference 'Drink.count' do
      post drinks_path params: { drink: { title: "title", content: "content", comment: "comment" } }
    end
    assert_redirected_to login_path
  end

end
