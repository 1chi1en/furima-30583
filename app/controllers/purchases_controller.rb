class PurchasesController < ApplicationController
  def index  
  end

  def new
  end

  def create
    @buyinfo = Buyinfo.new(buy_params)
  end

  private

  def buy_params
    params.require(:buyinfo).permit(:token, :post_code, :town, :address, :residence_name, :phone)
  end
end
