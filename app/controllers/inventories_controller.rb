class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:index, :show, :update, :destroy]

  # GET /inventories
  def index
    @inventories = Inventory.all

    # render json: @product
  end

  # GET /inventories/1
  def show
    render json: @inventory
  end

  # POST /inventories
  def create
    @inventory = Inventory.new(inventory_params)

    if @inventory.save
      render json: @inventory, status: :created, location: @inventory
    else
      render json: @inventory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inventories/1
  def update
    if @inventory.update(inventory_params)
      render json: @inventory
    else
      render json: @inventory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /inventories/1
  def destroy
    @inventory.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @product = Product.find(params[:product_id])
      # @inventory = Inventory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def inventory_params
      params.require(:inventory).permit(:quantity)
    end
end
