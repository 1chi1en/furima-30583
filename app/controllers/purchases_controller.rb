class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :find, only: [:index, :create]

  def index
    @buyinfo = Buyinfo.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    if @item.purchase
      redirect_to root_path
    end
  end

  def create
    @buyinfo = Buyinfo.new(buy_params)
    if @buyinfo.valid?
       paying
       @buyinfo.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.permit(
      :token, :post_code, :town, 
      :address, :residence_name, 
      :phone, :pref_id, :item_id
    ).merge(user_id: current_user.id)
  end

  def find
    @item = Item.find(params[:item_id])
  end

  def paying
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

end
