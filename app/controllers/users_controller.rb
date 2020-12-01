class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @items = current_user.items
    @birth_day = current_user.birth_day
  end
end
