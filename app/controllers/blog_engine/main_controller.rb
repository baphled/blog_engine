module BlogEngine
  class MainController < ApplicationController
    
    def index
      @articles = BlogEngine::Article.publicised
    end
  end
end