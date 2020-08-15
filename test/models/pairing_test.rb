require 'test_helper'

class PairingTest < ActiveSupport::TestCase
 
    # Itemにて共通している箇所は/test/model/item_test.rbでテストする

  def setup
    user = users(:tester)
    @drink = items(:beer)
    @food = items(:takoyaki)
    @pairing = user.pairings.build(title: "ビール×たこ焼き", drink_id: @drink.id, food_id: @food.id,
                                   comment: "最強、温泉行った後とか")

  end


  test "should be valid" do
    assert @pairing.valid?
  end

  test "content should be abesent" do
    @pairing.content = "example"
    assert_not @pairing.valid?
  end

  test "drink_id should be prensent" do
    @pairing.set_drink(nil)
    assert_not @pairing.valid?
  end

  test "food_id should be prensent" do
    @pairing.set_food(nil)
    assert_not @pairing.valid?
  end

  test "pairing sholud be unique" do
    duplicate_pairing = @pairing.dup
    @pairing.save
    assert_not duplicate_pairing.valid?
  end

  # これをpairingのテストに書くかは微妙なところ
  test "associated pairings should be destroyed by destroy drink" do
    @pairing.save
    assert_difference 'Pairing.count', -2 do
      @drink.destroy
    end
  end

  test "associated pairings should be destroyed by destroy food" do
    @pairing.save
    assert_difference 'Pairing.count', -1 do
      @food.destroy
    end
  end


  # メソッドの動作確認
  test "drink method sholud return drink of pairing" do
    assert_equal @drink, @pairing.drink
  end

  test "food method sholud return food of pairing" do
    assert_equal @food, @pairing.food
  end

end
