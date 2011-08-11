module BlogEngine
  class ArticlesController < BlogEngine::ApplicationController
    before_filter :find_tags
    
    def index
      @drafts = BlogEngine::Article.drafts
      @published = BlogEngine::Article.publicised
    end
    
    def new
      @article = BlogEngine::Article.new
      @categories = BlogEngine::Category.all
    end
    
    def edit
      @article = BlogEngine::Article.find params[:id]
    end
    
    def create
      @article = current_author.articles.new params[:blog_engine_article]
      if params[:commit] == 'Publish'
        flash[:notice] = "#{@article.title} was published"
        @article.publicise
      end
      if @article.save
        flash[:notice] = 'Created new draft' if flash[:notice].nil?
        redirect_to blog_engine_articles_path
      else
        render :new
      end
    end
    
    def update
      @article = current_author.articles.find params[:id]
      if params[:commit] == 'Publish'
        flash[:notice] = "#{@article.title} was published"
        @article.publicise
      end
      if @article.update_attributes params[:blog_engine_article]
        redirect_to blog_engine_articles_path
      else
        render :edit
      end
    end
    
    def show
      @article = BlogEngine::Article.find params[:id]
    end
    
    def article
      date = Date.new params[:year].to_i, params[:month].to_i
      @article = BlogEngine::Article
        .where(:published_at.gte => date)
        .where(:published_at.lte => date.end_of_month)
        .where(:slug => params[:slug])
        .publicised
        .first || not_found
      @comment = BlogEngine::Comment.new
    end
    
    def articles
      @articles = BlogEngine::Article.publicised
    end
    
    
    def tag
      @articles = BlogEngine::Article
        .tagged_with_any(params[:tag])
        .publicised
      render :articles
    end
    
    protected
    
    def find_tags
      @tag_cloud = BlogEngine::Article.tags_with_weight
    end
    
    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end