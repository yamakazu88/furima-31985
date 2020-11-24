class LogsController < ApplicationController
  before_action :item, only: [:index, :create]
  def index
    @order_log = OrderLog.new
  end

  def create
    binding.pry
    @order_log = OrderLog.new(log_params)
    if @order_log.valid?
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
