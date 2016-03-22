class TweetsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :redirect, only: :edit
  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
   @comment = Comment.new
    
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(create_params)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = Comment.where(commentable_type: "Tweet")
    @comment = Comment.new
  end

  def destroy
   tweet = Tweet.find(params[:id])
   tweet.destroy
  end

  def edit
   @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(update_params)
  end

  def redirect
    unless Tweet.exists?(user_id: current_user.id)
      redirect_to :root
    end
  end

  private
  def create_params
    params.require(:tweet).permit(:content, :image_url, :title).merge(user_id: current_user.id)
  end

    def update_params
    params.require(:tweet).permit(:content, :image_url, :title).merge(user_id: current_user.id)
  end

end
