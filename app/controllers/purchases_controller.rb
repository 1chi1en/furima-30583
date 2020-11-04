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
       Payjp.api_key = "sk_test_66649dcc9ad7c7049b947e9f"
       Payjp::Charge.create(
         amount: @item.price,
         card: buy_params[:token],
         currency: 'jpy'
       )
       @buyinfo.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.permit(
      :post_code, :town, 
      :address, :residence_name, 
      :phone, :pref_id, :item_id
    ).merge(user_id: current_user.id, token: params[:token])
  end

  def find
    @item = Item.find(params[:item_id])
  end

end
