class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(create_params)
  end
  def show
    @article = Article.find(params[:id])
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(update_params)
  end

  private
  def create_params
    params.require(:article).permit(:job, :content, :image_url, :title).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:article).permit(:job, :content, :image_url, :title)
  end

end
