class LikesController < ApplicationController
  before_action :authenticate_user!


  def create
    @comment = Comment.find(params[:comment_id])
    unless @comment.iine?(current_user)
      @comment.iine(current_user)
      @comment.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @comment = Like.find(params[:id]).comment
    if @comment.iine?(current_user)
      @comment.uniine(current_user)
      @comment.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
