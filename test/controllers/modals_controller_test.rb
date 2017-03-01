require 'test_helper'

class ModalsControllerTest < ActionDispatch::IntegrationTest
  test "should get photos" do
    get modals_photos_url
    assert_response :success
  end

end
