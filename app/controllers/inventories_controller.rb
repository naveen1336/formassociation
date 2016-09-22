class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]
  before_action :set_venue

  
  def index
    @inventories = @venue.inventories
  end

 
  def show
  end

 
  def new
    @inventory = Inventory.new
  end

 
  def edit

  end

 
  def create
    @inventory = Inventory.new(inventory_params)

    
      if @inventory.save
       redirect_to venue_inventories_path, notice: 'Inventory was successfully created.' 
        
      else
        render :new 
        
      end
   
  end

 
  def update
    
      if @inventory.update(inventory_params)
        redirect_to venue_inventories_path, notice: 'Inventory was successfully updated.' 
       
      else
         render :edit 
       
      end
    
  end

  
  def destroy
    @inventory.destroy
   
       redirect_to venue_inventories_path, notice: 'Inventory was successfully destroyed.'
      

  end

  private

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

   
    def inventory_params
      params.require(:inventory).permit(:name, :price, :category_id, :venue_id)
    end
end
