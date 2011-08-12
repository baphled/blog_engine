module BlogEngine
  class MainController < BlogEngine::ApplicationController
    def index
      @articles = BlogEngine::Article.publicised
    end
  end
end