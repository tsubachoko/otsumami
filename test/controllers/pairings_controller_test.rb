require 'test_helper'

class PairingsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:tester)
    @drink = items(:beer)
    @food = items(:takoyaki)
    @pairing = items(:nuts_and_beer)
  end
  
  test "should get index" do
    get pairings_path
    assert_response :success
  end

  test "should get show" do
    get pairing_path(@pairing)
    assert_response :success
  end

  test "post and delete when logged in" do
    log_in_as(@user)
    # 無効な投稿
    assert_no_difference 'Pairing.count' do
      post pairings_path params: { pairing: { title: "", drink_id: nil, food_id: nil, comment: "" } }
    end
    assert flash.any?
    # 有効な投稿
    assert_difference 'Pairing.count', 1 do
      post pairings_path params: { pairing: { title: "title", drink_id: @drink.id, food_id: @food.id, comment: "comment" } }
    end
    follow_redirect!
    assert_match @drink.title, response.body
    assert_match @food.title, response.body
  end

  test "new when not logged in" do
    get new_pairing_path
    assert_redirected_to login_path
    get pairings_new_drink_path
    assert_redirected_to login_path
    get pairings_new_food_path
    assert_redirected_to login_path
  end
  
  test "create when not logged in" do
    assert_no_difference 'Pairing.count' do
      post pairings_path params: { pairing: { title: "title", drink_id: @drink.id, food_id: @food.id, comment: "comment" } }
    end
    assert_redirected_to login_path
  end

  test "destroy when logged in" do
    log_in_as(@user)
    assert_difference 'Pairing.count', -1 do
      delete pairing_path(@pairing)
    end
    assert_redirected_to root_path
  end

  test "destroy when not logged in" do
    assert_no_difference 'Pairing.count' do
      delete pairing_path(@pairing)
    end
    assert_redirected_to login_path
  end

  test "destroy when logged in with wrong user" do
    other_user = users(:tester2)
    log_in_as(other_user)
    assert_no_difference 'Pairing.count' do
      delete pairing_path(@pairing)
    end
    assert_redirected_to root_path
  end

end
