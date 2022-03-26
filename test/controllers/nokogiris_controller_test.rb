require 'test_helper'

class NokogirisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nokogiris_index_url
    assert_response :success
  end

end
