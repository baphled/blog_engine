module BlogEngine
  class MainController < BlogEngine::ApplicationController
    layout 'tweet_engine'
    
    def index
      @articles = BlogEngine::Article.publicised
    end
  end
end