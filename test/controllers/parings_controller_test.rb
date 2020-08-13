require 'test_helper'

class ParingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parings_path
    assert_response :success
  end

end
