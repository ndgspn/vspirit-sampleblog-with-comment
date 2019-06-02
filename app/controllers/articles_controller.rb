class ArticlesController < ApplicationController
  before_action :article_id, only: [:show, :edit, :update, :destroy ]
  http_basic_authenticate_with name: "nan", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to @article
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  def article_id
    @article = Article.find(params[:id])
  end
end