class UserPropertySalesController < ApplicationController
  before_action :set_user_property_sale, only: %i[ show update destroy ]

  # GET /user_property_sales
  def index
    @user_property_sales = UserPropertySale.all

    render json: @user_property_sales
  end

  # GET /user_property_sales/1
  def show
    render json: @user_property_sale
  end

  # POST /user_property_sales
  def create
    @user_property_sale = UserPropertySale.new(user_property_sale_params)

    if @user_property_sale.save
      render json: @user_property_sale, status: :created, location: @user_property_sale
    else
      render json: @user_property_sale.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_property_sales/1
  def update
    if @user_property_sale.update(user_property_sale_params)
      render json: @user_property_sale
    else
      render json: @user_property_sale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_property_sales/1
  def destroy
    @user_property_sale.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_property_sale
      @user_property_sale = UserPropertySale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_property_sale_params
      params.require(:user_property_sale).permit(:user_id, :property_for_sale_id)
    end
end
