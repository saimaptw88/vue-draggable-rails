class ItemController < ApplicationController
  before_action :set_params, only: [:show, :update, :destroy]

  def index
    @items = Item.all
    render json: @items, each_serializer: ItemSerializer
  end

  def show
    return_item
  end

  def create
    Item.create(item_params)
    return_item
  end

  def update
    @item.update(item_params)
    return_item
  end

  def destroy
    @item.destroy
  end

  private
    def set_params
      @item = Item.find(params[:id])
    end

    def item_params
      params.permit(:name, :categoryNo, :index)
    end

    def return_item
      render json: @item, serializer: ItemSerializer
    end
end
