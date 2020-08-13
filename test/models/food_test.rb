require 'test_helper'

class FoodTest < ActiveSupport::TestCase
 
  # Itemにて共通している箇所は/test/model/item_test.rbでテストする

  def setup
    user = users(:tester)
    @food = user.foods.build(title: "チーズ", content: "ミルクを固めたもの",
                             comment: "なんでも合う")
  end

  test "should be valid" do
    assert @food.valid?
  end

  test "content should be present" do
    @food.content = " "
    assert_not @food.valid?
  end

  test "content should not be too long" do
    @food.content = "a" * 151
    assert_not @food.valid?
    @food.content = "a" * 150
    assert @food.valid?
  end

  test "drink_id should be abnsent" do
    @food.drink_id = 1
    assert_not @food.valid?
  end

  test "food_id should be abnsent" do
    @food.food_id = 1
    assert_not @food.valid?
  end

end
