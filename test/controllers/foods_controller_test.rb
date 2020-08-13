require 'test_helper'

class FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get foods_path
    assert_response :success
  end

end
