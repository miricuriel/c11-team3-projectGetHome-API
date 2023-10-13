class UserPropertySalesController < ApplicationController
  # before_action :set_property_sale, only: %i[ show update destroy ]
  # before_action :set_property_sale
 
  def index
    user_properties_sale= current_user.user_property_sale
    render json:user_properties_sale
  end

  def create
    p "create"
    # propiedad_sale_601 = UserPropertySale.new(user: cristhian_owner)
    # propiedad_601= Property.create(address:"Av. chalhuanca", property_type:1, operation_type:"sale", photo_url:"https://res.cloudinary.com/dvxvdktvr/image/upload/v1697046792/d3h7lv5hnyq2ukk0ufyh.png");
    # propiedad_sale_601.property = propiedad_601
    # propiedad_sale_601.save


    p property_params

    property_for_sale=UserPropertySale.new(user: current_user)

    property = Property.new(property_params)

    if property.save
      property_for_sale.property=property
      if property_for_sale.save
        render json: property_for_sale, status: :created
      
      else
        render json: { errors: property_for_sale.errors }, status: :unprocessable_entity
      end
    
    else
      render json: { errors: property.errors }, status: :unprocessable_entity
    end
    # @user_properties_sale= current_user.user_property_sale
    # render json:@user_properties_sale
  end


  private
  # def set_property_sale
  #   @property_sale = UserPropertySale.find(params[:id])
  # end
  def property_params
    params.permit(:address, :bedroom, :bathroom, :area, :description, :photos, :active, :operation_type, :property_type)
  end
end
