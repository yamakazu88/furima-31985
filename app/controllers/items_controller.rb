class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item,  only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
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

  def show
    #コメント機能の実装
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @favorite = Favorite.new
  end

  def edit
    if current_user.id != @item.user.id || @item.log.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id || @item.log.present?
      @item.destroy
    end
    redirect_to root_path
  end

  def search
    @items = @p.result  # 検索条件にマッチした商品の情報を取得
  end

   private
  def item_params
    params.require(:item).permit(:name, :text, :genre_id, :status_id, :charge_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  
end
