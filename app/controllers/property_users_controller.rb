class PropertyUsersController < ApplicationController

  def index
    properties = current_user.property_users
    if properties
      render json: properties, status: :ok
    else
      render json: {"error": "Not found"}, status: :not_found
    end
  end

  def show
    property = PropertyUser.find_by(id: params[:id])
    if property
      render json: property, status: :ok
    else
      render json: {"error": "Not found"}, status: :not_found
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
    # prop = PropertyUser.find_by(id: params[:id])
    # current_prop = prop.property_id
    # property = Property.find(current_prop)

    # updated = prop.update(user: current_user, property: property, favorite: params[:favorite], contacted: params[:contacted])

    # if updated
    #   render json: prop, status: :ok
    # else
    #   render json: { errors: updated.errors }, status: :unprocessable_entity
    # end
    
  end

  def destroy
    # property = PropertyUser.find_by(id: params[:id])
    # property.destroy 
  end
  
end
