require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:tester)
    @item = items(:beer)
    @favorite = @user.favorites.build(item: @item)
  end

  test "should be valid" do
    assert @favorite.valid?
  end

  test "user should be present" do
    @favorite.user = nil
    assert_not @favorite.valid?
  end

  test "item should be present" do
    @favorite.item = nil
    assert_not @favorite.valid?
  end

  test "user should be unique" do
    duplicate_favorite = @favorite.dup
    @favorite.save
    assert_not duplicate_favorite.valid?
  end

end
