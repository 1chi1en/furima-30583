class ItemsController < ApplicationController
  #ルーティングや接続確認の際にトップページに飛ばされると困るのでauthenticate_user!を一時的にオフ
  #before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end
end
