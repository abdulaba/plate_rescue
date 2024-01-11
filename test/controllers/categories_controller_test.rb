require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get categories_name_url
    assert_response :success
  end
end
