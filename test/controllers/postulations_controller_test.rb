require 'test_helper'

class PostulationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postulations_index_url
    assert_response :success
  end

end
