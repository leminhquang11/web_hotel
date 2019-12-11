require 'test_helper'

class ServiceReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get service_reviews_create_url
    assert_response :success
  end

end
