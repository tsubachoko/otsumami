require 'test_helper'

class FoodsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
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

end
