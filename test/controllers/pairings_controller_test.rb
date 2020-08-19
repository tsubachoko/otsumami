require 'test_helper'

class PairingsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @pairing = items(:nuts_and_beer)
  end
  
  test "should get index" do
    get pairings_path
    assert_response :success
  end

  test "should get show" do
    get pairing_path(@pairing)
    assert_response :success
  end

end
