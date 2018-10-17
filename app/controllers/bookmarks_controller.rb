class BookmarksController < ApplicationController
  before_action :authenticate_user!, :only => [:toggle, :index]

  def toggle
    @article = Article.find(params[:article_id])
    user_bookmarks =current_user.bookmarks

    if user_bookmarks.exists?(article: @article.id)
      redirect_to articles_show_path(id: @article.id)
    else
      bookmark= Bookmark.new(user_id: current_user.id, article_id: @article.id)
      bookmark.save
      redirect_to articles_show_path(id: @article.id)
    end
  end

  def index
    @user = User.find_by(id: current_user.id)
    bookmarks = @user.bookmarks
    @my_articles =[]
    bookmarks.ids.each do |bookmark|
      article= Article.find_by(id: bookmark)
      @my_articles.push(article.attributes)
    end
  end

end
