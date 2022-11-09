class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: %i[show edit update destroy]

  # GET /items
  def index
    @items = @list.items
  end

  # GET /items/1
  def show; end

  # GET /items/new
  def new
    @item = @list.items.new
  end

  # GET /items/1/edit
  def edit; end

  # POST /items
  def create
    @item = @list.items.new(item_params)

    if @item.save
      redirect_to list_items_path(@list), notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to list_items_path(@list), notice: "Item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to list_items_path(@list), notice: "Item was successfully destroyed."
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = @list.items.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:list_id, :description, :quantity, :completed)
    end
  
    def set_list
      @list = List.find(params[:list_id])
    end
end
