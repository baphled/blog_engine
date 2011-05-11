module BlogEngine
  class ArticlesController < ApplicationController
    
    def index
    end
    
    def new
      @article = BlogEngine::Article.new
      @categories = BlogEngine::Category.all
    end
    
    def edit
      @article = BlogEngine::Article.find params[:id]
    end
    
    def create
      @article = BlogEngine::Article.new params[:blog_engine_article]
      if @article.save
        redirect_to blog_engine_article_path :id => @article.id
      else
        render :new
      end
    end
    
    def update
      @article = BlogEngine::Article.find params[:id]
      if @article.update_attributes params[:blog_engine_article]
        redirect_to blog_engine_article_path :id => @article.id
      else
        render :edit
      end
    end
    
    def show
      @article = BlogEngine::Article.find params[:id]
    end
  end
end