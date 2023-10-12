class UserPropertyRentsController < ApplicationController
  before_action :set_user_property_rent, only: %i[ show update destroy ]

  # GET /user_property_rents
  def index
    @user_property_rents = UserPropertyRent.all

    render json: @user_property_rents
  end

  # GET /user_property_rents/1
  def show
    render json: @user_property_rent
  end

  # POST /user_property_rents
  def create
    @user_property_rent = UserPropertyRent.new(user_property_rent_params)

    if @user_property_rent.save
      render json: @user_property_rent, status: :created, location: @user_property_rent
    else
      render json: @user_property_rent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_property_rents/1
  def update
    if @user_property_rent.update(user_property_rent_params)
      render json: @user_property_rent
    else
      render json: @user_property_rent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_property_rents/1
  def destroy
    @user_property_rent.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_property_rent
      @user_property_rent = UserPropertyRent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_property_rent_params
      params.require(:user_property_rent).permit(:user_id, :property_for_rent_id)
    end
end
