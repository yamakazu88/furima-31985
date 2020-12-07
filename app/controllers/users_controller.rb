class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @items = @user.items
    @birth_day = @user.birth_day
    @favorites = @user.favorites.includes(:user)
  end
end