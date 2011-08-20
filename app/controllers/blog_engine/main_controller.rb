module BlogEngine
  class MainController < BlogEngine::ApplicationController
    def index
      @articles = BlogEngine::Article.publicised
      render '/blog_engine/articles/articles'
    end
  end
end