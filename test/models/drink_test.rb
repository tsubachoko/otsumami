require 'test_helper'

class DrinkTest < ActiveSupport::TestCase
 
  # Itemにて共通している箇所は/test/model/item_test.rbでテストする

  def setup
    user = users(:tester)
    @drink = user.drinks.build(title: "ワイン", content: "ぶどうを発酵させたもの",
                               comment: "渋みがあるものも多いが、おいしいのはおいしい")
  end


  test "should be valid" do
    assert @drink.valid?
  end

  test "content should be present" do
    @drink.content = " "
    assert_not @drink.valid?
  end

  test "content should not be too long" do
    @drink.content = "a" * 151
    assert_not @drink.valid?
    @drink.content = "a" * 150
    assert @drink.valid?
  end

  test "drink_id should be abnsent" do
    @drink.drink_id = 1
    assert_not @drink.valid?
  end

  test "food_id should be abnsent" do
    @drink.food_id = 1
    assert_not @drink.valid?
  end

end
