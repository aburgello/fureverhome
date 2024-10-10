require "test_helper"

class AdoptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get adoptions_new_url
    assert_response :success
  end

  test "should get create" do
    get adoptions_create_url
    assert_response :success
  end
end
