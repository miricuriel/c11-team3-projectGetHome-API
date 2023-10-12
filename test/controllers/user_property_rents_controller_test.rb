require "test_helper"

class UserPropertyRentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_property_rent = user_property_rents(:one)
  end

  test "should get index" do
    get user_property_rents_url, as: :json
    assert_response :success
  end

  test "should create user_property_rent" do
    assert_difference("UserPropertyRent.count") do
      post user_property_rents_url, params: { user_property_rent: { property_for_rent_id: @user_property_rent.property_for_rent_id, user_id: @user_property_rent.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show user_property_rent" do
    get user_property_rent_url(@user_property_rent), as: :json
    assert_response :success
  end

  test "should update user_property_rent" do
    patch user_property_rent_url(@user_property_rent), params: { user_property_rent: { property_for_rent_id: @user_property_rent.property_for_rent_id, user_id: @user_property_rent.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy user_property_rent" do
    assert_difference("UserPropertyRent.count", -1) do
      delete user_property_rent_url(@user_property_rent), as: :json
    end

    assert_response :no_content
  end
end
