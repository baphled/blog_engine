Rails.application.routes.draw do
  devise_for :author,
    :class_name => 'BlogEngine::Author',
    :controllers => { :registrations => "blog_engine/authors/registrations" }
  
  match '/blog-engine', :controller => 'blog_engine/articles', :action => :articles, :as => :blog_engine_published_articles
  
  authenticate :author do
    resource 'blog-engine', :controller => 'blog_engine/engine', :as => :blog_engine, :only => [:index] do
      resources :articles, :controller => 'blog_engine/articles' do
        resources :comments, :controller => 'blog_engine/comments'
      end
      resources :categories, :controller => 'blog_engine/categories'
    
    end
  end
  
  match '/blog-engine/tag/:tag',
    :controller => 'blog_engine/articles',
    :action => :tag,
    :as => :blog_engine_published_articles_by_tag
  
  match '/blog-engine/:year/:month/:slug',
    :controller => 'blog_engine/articles',
    :action => :article,
    :as => :blog_engine_published_article
  

  root :to => "blog_engine/main#index"
end
