class PurchasesController < ApplicationController
  before_action :find, only: [:index, :create]

  def index
    @buyinfo = Buyinfo.new
  end

  def new
  end

  def create
    @buyinfo = Buyinfo.new(buy_params)
    if @buyinfo.valid?
       @buyinfo.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.permit(:token, :post_code, :town, :address, :residence_name, :phone, :pref_id, :item_id).merge(user_id: current_user.id)
  end

  def find
    @item = Item.find(params[:item_id])
  end

end
