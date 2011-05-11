Rails.application.routes.draw do
  resource 'blog-engine', :controller => 'blog_engine/engine', :as => :blog_engine, :only => [:index] do
    resources :articles, :controller => 'blog_engine/articles'
    resources :categories, :controller => 'blog_engine/categories'
  end
end
