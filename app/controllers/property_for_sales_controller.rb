class PropertyForSalesController < ApplicationController
  before_action :set_property_for_sale, only: %i[ show update destroy ]

  # GET /property_for_sales
  def index
    @property_for_sales = PropertyForSale.all

    render json: @property_for_sales
  end

  # GET /property_for_sales/1
  def show
    render json: @property_for_sale
  end

  # POST /property_for_sales
  def create
    @property_for_sale = PropertyForSale.new(property_for_sale_params)

    if @property_for_sale.save
      render json: @property_for_sale, status: :created, location: @property_for_sale
    else
      render json: @property_for_sale.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /property_for_sales/1
  def update
    if @property_for_sale.update(property_for_sale_params)
      render json: @property_for_sale
    else
      render json: @property_for_sale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /property_for_sales/1
  def destroy
    @property_for_sale.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_for_sale
      @property_for_sale = PropertyForSale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_for_sale_params
      params.require(:property_for_sale).permit(:price, :properties_id)
    end
end
