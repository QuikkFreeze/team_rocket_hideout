require 'test_helper'

class TypingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get typing_index_url
    assert_response :success
  end

  test "should get show" do
    get typing_show_url
    assert_response :success
  end

end
