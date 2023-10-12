class PropertiesController < ApplicationController
  def index
    @properties = Property.all
    render json: @properties
  end

  def show 
    @property = Property.find_by(id: params[:id])
    if @property.nil?
      render json: {"message": "Property not found"}, status: :not_found
    else
      render json: @property
    end
  end

  def create
    @property = Property.create(property_params)
    
    if @property
      render json: @property, status: :created
    else
      render json: @property.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def property_params
    params.require(:property).permit(:address, :operation_type, :bedroom, :bathroom, :area, :description, :photo_url, )
  end
end
