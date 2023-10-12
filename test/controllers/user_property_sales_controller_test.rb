require "test_helper"

class UserPropertySalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_property_sale = user_property_sales(:one)
  end

  test "should get index" do
    get user_property_sales_url, as: :json
    assert_response :success
  end

  test "should create user_property_sale" do
    assert_difference("UserPropertySale.count") do
      post user_property_sales_url, params: { user_property_sale: { property_for_sale_id: @user_property_sale.property_for_sale_id, user_id: @user_property_sale.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show user_property_sale" do
    get user_property_sale_url(@user_property_sale), as: :json
    assert_response :success
  end

  test "should update user_property_sale" do
    patch user_property_sale_url(@user_property_sale), params: { user_property_sale: { property_for_sale_id: @user_property_sale.property_for_sale_id, user_id: @user_property_sale.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy user_property_sale" do
    assert_difference("UserPropertySale.count", -1) do
      delete user_property_sale_url(@user_property_sale), as: :json
    end

    assert_response :no_content
  end
end
