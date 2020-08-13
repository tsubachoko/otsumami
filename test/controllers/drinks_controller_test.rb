require 'test_helper'

class DrinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get drinks_path
    assert_response :success
  end

end
