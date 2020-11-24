class LogsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item, only: [:index, :create]
  def index
    if current_user.id == @item.user.id || item.log.present?
      redirect_to root_path
    end
    @order_log = OrderLog.new
  end

  def create
    @order_log = OrderLog.new(log_params)
    if @order_log.valid?
      pay_item
      @order_log.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def log_params
    params.require(:order_log).permit(:postal_code, :city, :house_number, :building_name, :prefecture, :tell).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: log_params[:token],
      currency: 'jpy'
    )
  end
end
