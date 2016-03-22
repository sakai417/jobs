class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    @tweets = @user.tweets.page(params[:page]).per(5).order("created_at DESC")
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    current_user.update(update_params)
  end

  private
  def update_params
    params.require(:user).permit(:nickname, :job, :avatar)
  end

end
