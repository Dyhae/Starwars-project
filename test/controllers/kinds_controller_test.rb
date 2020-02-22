require 'test_helper'

class KindsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kinds_index_url
    assert_response :success
  end

  test "should get show" do
    get kinds_show_url
    assert_response :success
  end

end
