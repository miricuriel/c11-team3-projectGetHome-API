class PropertiesController < ApplicationController
  skip_before_action :require_login!, only: [:index, :show]

  def index
    render json: Property.all
  end

  def show 
    property = Property.find_by(id: params[:id])

    if property
      render json: property
    else
      render json: {"message": "Property not found"}, status: :not_found
    end
  end

  def update
    properties = UserPropertyRent.where(user: current_user).map { |prop| Property.where(id: prop.property) }
    properties += UserPropertySale.where(user: current_user).map { |prop| Property.where(id: prop.property) }
    properties = properties.flatten.map(&:as_json)
   
    property = Property.where(id: params[:id])

    if property.update(property_params)
      render json: property, status: :ok
    else
      render json: {errors: @property.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    property = Property.find(params[:id])

    property.destroy 
  end

  private

  def property_params
    params.require(:property).permit(:address, :operation_type, :bedroom, :bathroom, :area, :description, :photo_url, :active, :price, :monthly_rent, :maintenance, :pets_allowed, :property_type, :longitud, :latitud )
  end
end
