class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
    render json: @items
  end

  def show
    render json: @item
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
