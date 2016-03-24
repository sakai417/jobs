class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :redirect, only: [:edit]

  def index
    @articles = Article.includes(:user).order("created_at DESC").page(params[:page]).per(10)
    @article = Article.find_by(user_id: current_user.id)
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(create_params)
    redirect_to :root
  end
  def show
    @article = Article.find(params[:id])
    @comments = Comment.where(commentable_id: "#{@article.id}", commentable_type: "Article").order("created_at DESC")
    @comment = Comment.new
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to :root
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update

    article = Article.find(params[:id])
    article.update(update_params)
    redirect_to :root
  end

  def explanation
  end

  private

  def redirect
    unless Article.exists?(user_id: current_user.id)
      redirect_to :root
    end
  end

  def create_params
    params.require(:article).permit(:content, :image_url, :title).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:article).permit(:content, :image_url, :title).merge(user_id: current_user.id)
  end

end
