class UsersController < ApplicationController
  before_action :set_user

  def show
    @nickname = @user.nickname
    @items = @user.items.order("created_at DESC")
    @birth_day = @user.birth_day
    @favorites = @user.favorites.includes(:user)
  end

  def following
    @users = @user.followings.page(params[:page]).per(5)
    render 'following'
  end

  def followers
    @users = @user.followers.page(params[:page]).per(5)
    render 'followers'
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
