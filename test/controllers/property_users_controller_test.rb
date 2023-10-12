require "test_helper"

class PropertyUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property_user = property_users(:one)
  end

  test "should get index" do
    get property_users_url, as: :json
    assert_response :success
  end

  test "should create property_user" do
    assert_difference("PropertyUser.count") do
      post property_users_url, params: { property_user: { contacted: @property_user.contacted, favorite: @property_user.favorite, property_id: @property_user.property_id, user_id: @property_user.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show property_user" do
    get property_user_url(@property_user), as: :json
    assert_response :success
  end

  test "should update property_user" do
    patch property_user_url(@property_user), params: { property_user: { contacted: @property_user.contacted, favorite: @property_user.favorite, property_id: @property_user.property_id, user_id: @property_user.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy property_user" do
    assert_difference("PropertyUser.count", -1) do
      delete property_user_url(@property_user), as: :json
    end

    assert_response :no_content
  end
end
