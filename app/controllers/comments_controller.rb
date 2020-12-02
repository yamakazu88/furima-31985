class CommentsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new(comment_params)
    if @comment.save
      redirect_to item_path(@comment.item.id)
    else
      @item = @comment.item
      @comments = @item.comments
      render "items/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
