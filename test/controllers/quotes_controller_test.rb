require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get quotes_create_url
    assert_response :success
  end

end
