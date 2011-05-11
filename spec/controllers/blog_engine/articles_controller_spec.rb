require 'spec_helper'

describe BlogEngine::ArticlesController do
  describe "GET, new" do

    it "gets a new article" do
      BlogEngine::Article.should_receive :new
      get :new
    end
  end
  
  describe "POST, create" do
    before(:each) do
      @article = BlogEngine::Article.new :title => "My title", :content => "My content", :tags => "foo, bar, baz"
      BlogEngine::Article.stub(:new).and_return @article
    end
    
    it "create a new article instance" do
      BlogEngine::Article.should_receive :new
      post :create, :blog_engine_article => @article
    end
    
    it "saves the article" do
      @article.should_receive :save
      post :create, :blog_engine_article => @article
    end
    
    it "redirects to the article" do
      post :create, :blog_engine_article => @article
      response.should redirect_to blog_engine_article_path(:id => @article.id)
    end
  end
end