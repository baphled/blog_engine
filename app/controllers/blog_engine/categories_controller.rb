module BlogEngine
  class CategoriesController < ApplicationController
    
    def new
      @category = BlogEngine::Category.new
    end
    
    def create
      @category = BlogEngine::Category.new params[:blog_engine_category]
      @category.save
      redirect_to blog_engine_articles_path :id => @category.id
    end
    
    def index
      @categories = BlogEngine::Category.all
      respond_to do |format|
        format.html { render :index }
        format.json { render :json => @categories.map(&:attributes).to_json }
      end
    end
  end
end