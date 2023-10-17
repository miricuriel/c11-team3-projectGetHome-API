class UserPropertyRentsController < ApplicationController
  # before_action :set_property_sale, only: %i[ show update destroy ]
  # before_action :set_property_sale
 
  def index
    user_properties_rent= current_user.user_property_rent
    render json:user_properties_rent
  end

  def create

    property_for_rent=UserPropertyRent.new(user: current_user)

    property = Property.new(property_params)
    property.operation_type ="rent"

    if property.save
      property_for_rent.property=property
      if property_for_rent.save
        render json: property_for_rent, status: :created
      else
        render json: { errors: property_for_rent.errors }, status: :unprocessable_entity
      end
    
    else
      render json: { errors: property.errors }, status: :unprocessable_entity
    end
  end


  private
  # def set_property_sale
  #   @property_sale = UserPropertySale.find(params[:id])
  # end
  def property_params
    params.permit(:address, :bedrooms, :bathrooms, :area, :description,:monthly_rent,:maintenance,:pets_allowed ,:active, :operation_type, :property_type, photo_url: [])
  end
end
