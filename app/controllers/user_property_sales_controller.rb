class UserPropertySalesController < ApplicationController
  # before_action :set_property_sale, only: %i[ show update destroy ]
  # before_action :set_property_sale
 
  def index
    user_properties_sale= current_user.user_property_sale
    render json:user_properties_sale
  end

  def create
    property_for_sale = UserPropertySale.new(user: current_user)
    property = Property.new(property_params)
    property.operation_type ="sale"

    if property.save
      property_for_sale.property = property

      if property_for_sale.save
        render json: property_for_sale, status: :created
      else
        render json: { errors: property_for_sale.errors }, status: :unprocessable_entity
      end
    
    else
      render json: { errors: property.errors }, status: :unprocessable_entity
    end

  end

  private
  
  def property_params
    params.permit(:address, :bedrooms, :bathrooms, :area, :description, :price, :active,:operation_type, :property_type, photo_url: [])
  end
end
