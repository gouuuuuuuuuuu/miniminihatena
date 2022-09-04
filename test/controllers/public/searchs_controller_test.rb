require "test_helper"

class Public::SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_searchs_show_url
    assert_response :success
  end
end
