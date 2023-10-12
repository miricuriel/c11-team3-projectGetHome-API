require "test_helper"

class PropertyForRentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property_for_rent = property_for_rents(:one)
  end

  test "should get index" do
    get property_for_rents_url, as: :json
    assert_response :success
  end

  test "should create property_for_rent" do
    assert_difference("PropertyForRent.count") do
      post property_for_rents_url, params: { property_for_rent: { maintenance: @property_for_rent.maintenance, monthly_rent: @property_for_rent.monthly_rent, pets_allowed: @property_for_rent.pets_allowed, properties_id: @property_for_rent.properties_id } }, as: :json
    end

    assert_response :created
  end

  test "should show property_for_rent" do
    get property_for_rent_url(@property_for_rent), as: :json
    assert_response :success
  end

  test "should update property_for_rent" do
    patch property_for_rent_url(@property_for_rent), params: { property_for_rent: { maintenance: @property_for_rent.maintenance, monthly_rent: @property_for_rent.monthly_rent, pets_allowed: @property_for_rent.pets_allowed, properties_id: @property_for_rent.properties_id } }, as: :json
    assert_response :success
  end

  test "should destroy property_for_rent" do
    assert_difference("PropertyForRent.count", -1) do
      delete property_for_rent_url(@property_for_rent), as: :json
    end

    assert_response :no_content
  end
end
