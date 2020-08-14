require 'test_helper'

class ParingTest < ActiveSupport::TestCase
 
    # Itemにて共通している箇所は/test/model/item_test.rbでテストする

  def setup
    user = users(:tester)
    @drink = items(:beer)
    @food = items(:nuts)
    @paring = user.parings.build(title: "ビール×ナッツ", drink_id: @drink.id, food_id: @food.id,
                                 comment: "悪かない")
  end


  test "should be valid" do
    assert @paring.valid?
  end

  test "content should be abesent" do
    @paring.content = "example"
    assert_not @paring.valid?
  end

  test "drink_id should be prensent" do
    @paring.set_drink(nil)
    assert_not @paring.valid?
  end

  test "food_id should be prensent" do
    @paring.set_food(nil)
    assert_not @paring.valid?
  end

  test "paring sholud be unique" do
    duplicate_paring = @paring.dup
    @paring.save
    assert_not duplicate_paring.valid?
  end

  # これをparingのテストに書くかは微妙なところ
  test "associated parings should be destroyed by destroy drink" do
    @paring.save
    assert_difference 'Paring.count', -1 do
      @drink.destroy
    end
  end

  test "associated parings should be destroyed by destroy food" do
    @paring.save
    assert_difference 'Paring.count', -1 do
      @food.destroy
    end
  end


  # メソッドの動作確認
  test "drink method sholud return drink of paring" do
    assert_equal @drink, @paring.drink
  end

  test "food method sholud return food of paring" do
    assert_equal @food, @paring.food
  end

end
