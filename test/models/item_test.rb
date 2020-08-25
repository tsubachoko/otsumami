require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  # Itemにて共通している箇所は/test/model/item_test.rbでテストする
  # 代表してDrinkでテスト

  def setup
    user = users(:tester)
    @drink = user.drinks.build(title: "ワイン", content: "ぶどうを発酵させたもの",
                               comment: "渋みがあるものも多いが、おいしいのはおいしい")
  end

  test "should be valid" do
    assert @drink.valid?
  end

  test "user_id should be present" do
    @drink.user_id = nil
    assert_not @drink.valid?
  end

  test "type should be present" do
    @drink.type = " "
    assert_not @drink.valid?
  end

  test "title should be present" do
    @drink.title = " "
    assert_not @drink.valid?
  end

  test "title should not be too long" do
    @drink.title = "a" * 31
    assert_not @drink.valid?
    @drink.title = "a" * 30
    assert @drink.valid?
  end

  test "comment should not be present" do
    @drink.comment = " "
    assert @drink.valid?
  end


  
end
