class CommentsController < ApplicationController


  def create
    Comment.create(create_params)
  end

  private
  def create_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type).merge(user_id: current_user.id)
  end

end
