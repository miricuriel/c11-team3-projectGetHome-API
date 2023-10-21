class PropertyUsersController < ApplicationController

  # def index
  #   properties = current_user.save_properties

  #   render json: properties, status: :ok
  #   properties = current_user.property_users
  #   render json: properties
  # end

  def show
    current_saved = current_user.save_properties
    prop = current_saved.find_by(id: params[:id])

    if prop.nil?
      render json: { message: "Propery not found" }, status: :unprocessable_entity
    else
      render json: prop
    end
  end

  def checkout
   
    property_user= PropertyUser.find_by(user_id:params[:user_id], property_id:params[:property_id])
    
      render json: property_user, status: :created
   
  end

  def showUser
   
    property = Property.find_by(id: params[:property_id])
    if property
      if(property.operation_type=="sale")
        render json: property.user_sale, status: :created
      end
      if(property.operation_type=="rent")
        render json: property.user_rent, status: :created
      end
    else
      render json: { errors:property.errors }, status: :unprocessable_entity
    end
  end

  def create
    property = Property.find(params[:property_id])

    favorite = params[:favorite]
    contacted = params[:contacted]

    @new_property = PropertyUser.create(
      user: current_user,
      property: property,
      favorite: favorite,
      contacted: contacted
    )

    if @new_property
      render json: @new_property, status: :created
    else
      render json: { errors: @new_property.errors }, status: :unprocessable_entity
    end
  end

  def update
  
    prop = PropertyUser.find_by(id: params[:id])

    updated = prop.update( propertyuser_params)

    if updated
      render json: prop, status: :ok
    else
      render json: { errors: updated.errors }, status: :unprocessable_entity
    end
    
  end

  def destroy
    property = PropertyUser.find_by(id: params[:id])
    property.destroy 
  end

  def propertyuser_params
    params.permit( :contacted, :favorite)
  end
  
end
