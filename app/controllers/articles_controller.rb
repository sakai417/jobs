class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(create_params)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
  end

  private
  def create_params
    params.require(:article).permit(:nickname, :job, :content, :image_url)
  end

end
