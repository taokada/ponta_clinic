class ArticlesController < ApplicationController
  def show
    @article=Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments
  end

  def clean_blog
    @article=Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments
  end


end
