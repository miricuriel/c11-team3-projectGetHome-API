class UserPropertySalesController < ApplicationController
 
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

  def showUserProperty
    user_property_sale = UserPropertySale.find_by(user_id: params[:user_id], property_id: params[:property_id]);
  
    if user_property_sale
      render json: user_property_sale, status: :ok
    else
      render json: {"message": "UserPropertySale not found"}, status: :not_found
    end
  end

  private
  
  def property_params
    params.permit(:address, :bedrooms, :bathrooms, :area, :description, :price, :active,:operation_type, :property_type, :latitud, :longitud, photo_url: [])
  end
end
