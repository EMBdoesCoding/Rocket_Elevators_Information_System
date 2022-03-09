require 'test_helper'

class QuotesControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get quotes_controller_create_url
    assert_response :success
  end

end
