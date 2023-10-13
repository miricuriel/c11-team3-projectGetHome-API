class PropertyUsersController < ApplicationController
  def index
    @properties = PropertyUser.all
    if @properties
      render json: @properties, status: :ok
    else
      render json: {"error": "Not found"}, status: :not_found
    end
  end

  # def create
  #   new_property = Property.find_by(id: params[:id])
  #   @properties << new_property
  # end

  def show
    property = PropertyUser.find_by(id: params[:id])
    if property
      render json: property, status: :ok
    else
      render json: {"error": "Not found"}, status: :not_found
    end
  end

  def destroy
    property = PropertyUser.find_by(id: params[:id])
    property.destroy
  end
end
