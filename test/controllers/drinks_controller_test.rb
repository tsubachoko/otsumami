require 'test_helper'

class DrinksControllerTest < ActionDispatch::IntegrationTest
  
  def setup
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

end
