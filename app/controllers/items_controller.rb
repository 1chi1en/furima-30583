class ItemsController < ApplicationController
  #ルーティングや接続確認の際にトップページに飛ばされるのが面倒なのでauthenticate_user!を一時的にオフ
  #before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
  end

  def create
  end
end
