require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  
  test "should be favorite and unfavorite" do
    user = users(:tester)
    item = items(:beer)
    log_in_as(user)
    # Favorite
    assert_difference 'Favorite.count', 1 do
      post favorites_path, params: { item_id: item.id }
    end
    # Unfavorite
    favorite = user.favorites.find_by(item_id: item.id)
    assert_difference 'Favorite.count', -1 do
      delete favorite_path(favorite)
    end
  end

  test "create should require logged_in user" do
    assert_no_difference 'Favorite.count' do
      post favorites_path
    end
    assert_redirected_to login_path
  end

  test "destroy should require logged_in user" do
    assert_no_difference 'Favorite.count' do
      delete favorite_path(favorites(:one))
    end
    assert_redirected_to login_path
  end

end
