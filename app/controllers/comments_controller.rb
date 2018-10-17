class CommentsController < ApplicationController

  before_action :authenticate_user!, :only => [:create, :edit, :update]




  def aaa
  end

  def create
    @comment = Comment.new(body: params[:comment], article_id: params[:article_id], user_id: params[:user_id])
    @comment.save
    redirect_to controller: 'articles', action: 'show', id: params[:article_id]
  end

  def edit
    @comment = Comment.find(params[:id])
    @article = Article.find(params[:article_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @article = Article.find(params[:article_id])
    redirect_to articles_show_path(id: @article.id)

  end

  def update
    @comment = Comment.find(params[:id])
    @comment.body = params[:comment]
    @comment.save
    @article = Article.find(params[:article_id])
    redirect_to articles_show_path(id: @article.id)
  end
end
