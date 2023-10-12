class PropertyForRentsController < ApplicationController
  before_action :set_property_for_rent, only: %i[ show update destroy ]

  # GET /property_for_rents
  def index
    @property_for_rents = PropertyForRent.all

    render json: @property_for_rents
  end

  # GET /property_for_rents/1
  def show
    render json: @property_for_rent
  end

  # POST /property_for_rents
  def create
    @property_for_rent = PropertyForRent.new(property_for_rent_params)

    if @property_for_rent.save
      render json: @property_for_rent, status: :created, location: @property_for_rent
    else
      render json: @property_for_rent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /property_for_rents/1
  def update
    if @property_for_rent.update(property_for_rent_params)
      render json: @property_for_rent
    else
      render json: @property_for_rent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /property_for_rents/1
  def destroy
    @property_for_rent.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_for_rent
      @property_for_rent = PropertyForRent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_for_rent_params
      params.require(:property_for_rent).permit(:monthly_rent, :maintenance, :pets_allowed, :properties_id)
    end
end
