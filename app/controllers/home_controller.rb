class HomeController < ApplicationController

  def top
  end


  def index
    @articles=Article.all

  end

  def category
  end
end
