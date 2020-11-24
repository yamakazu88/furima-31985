class LogsController < ApplicationController
  before_action :item, only: [:index, :create]
  def index
    @order_log = OrderLog.new
  end

  def create
    @order_log = OrderLog.new(log_params)
    if @order_log.valid?
      Payjp.api_key = "sk_test_4f3f2f0334ac8c91192a0e77"
      Payjp::Charge.create(
        amount: @item.price,
        card: log_params[:token],
        currency: 'jpy'
      )
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
end
