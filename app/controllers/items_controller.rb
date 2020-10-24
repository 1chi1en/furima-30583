class ItemsController < ApplicationController
  #ルーティングや接続確認の際にトップページに飛ばされると困るのでauthenticate_user!を一時的にオフ
  #before_action :authenticate_user!, except: [:index, :show]
  def index
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

  private

  def item_params
    params.require(:item).permit(:image, :title, :detail, :price, :category_id, :condition_id, :shipping_id, :pref_id, :shipping_day_id).merge(user_id: current_user.id)
  end

end
