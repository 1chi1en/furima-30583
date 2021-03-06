class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def find
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :title, :detail, :price, :category_id, :condition_id, :shipping_id, :pref_id, :shipping_day_id).merge(user_id: current_user.id)
  end

end
