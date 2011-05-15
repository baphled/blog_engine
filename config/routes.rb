Rails.application.routes.draw do
  devise_for :authors, :class_name => 'BlogEngine::Author', :controller => 'blog_engine/author'
  
  authenticate :author do
    resource 'blog-engine', :controller => 'blog_engine/engine', :as => :blog_engine, :only => [:index] do
      resources :articles, :controller => 'blog_engine/articles'
      resources :categories, :controller => 'blog_engine/categories'
    
    end
  end
  
  match '/blog-engine/:year/:month/:slug',
    :controller => 'blog_engine/articles',
    :action => :article,
    :as => :blog_engine_published_article
  
  root :to => "blog_engine/articles#index"
end
