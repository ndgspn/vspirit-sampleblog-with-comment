class CommentsController < ApplicationController
  before_action :article_id, only: [:create, :destroy]
  http_basic_authenticate_with name: "nan", password: "secret", except: [:create]

  def create
    @comment  = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def article_id
    @article  = Article.find(params[:article_id])
  end
end
