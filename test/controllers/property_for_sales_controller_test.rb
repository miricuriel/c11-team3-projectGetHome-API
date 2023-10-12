require "test_helper"

class PropertyForSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property_for_sale = property_for_sales(:one)
  end

  test "should get index" do
    get property_for_sales_url, as: :json
    assert_response :success
  end

  test "should create property_for_sale" do
    assert_difference("PropertyForSale.count") do
      post property_for_sales_url, params: { property_for_sale: { price: @property_for_sale.price, properties_id: @property_for_sale.properties_id } }, as: :json
    end

    assert_response :created
  end

  test "should show property_for_sale" do
    get property_for_sale_url(@property_for_sale), as: :json
    assert_response :success
  end

  test "should update property_for_sale" do
    patch property_for_sale_url(@property_for_sale), params: { property_for_sale: { price: @property_for_sale.price, properties_id: @property_for_sale.properties_id } }, as: :json
    assert_response :success
  end

  test "should destroy property_for_sale" do
    assert_difference("PropertyForSale.count", -1) do
      delete property_for_sale_url(@property_for_sale), as: :json
    end

    assert_response :no_content
  end
end
