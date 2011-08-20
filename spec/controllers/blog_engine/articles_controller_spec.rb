require 'spec_helper'

describe BlogEngine::ArticlesController do
  before(:each) do
    @author = BlogEngine::Author.create(:email => Faker::Internet.email, :password => 'foobar')
    controller.stub(:current_author).and_return @author
  end
  
  describe "GET, new" do
    it "gets a new article" do
      BlogEngine::Article.should_receive :new
      get :new
    end
  end
  
  describe "POST, create" do
    before(:each) do
      @article = @author.articles.new :title => "My title", :content => "My content", :tags => "foo, bar, baz", :published_at => nil
      controller.current_author.articles.stub(:new).and_return @article
    end
    
    it "create a new article instance" do
      controller.current_author.articles.should_receive :new
      post :create, :blog_engine_article => @article
    end
    
    it "saves the article" do
      @article.should_receive(:save).at_least(:once)
      post :create, :blog_engine_article => @article
    end
    
    it "redirects to the article" do
      post :create, :blog_engine_article => @article
      response.should redirect_to blog_engine_articles_path
    end
    
    it "publishing article" do
      controller.should_receive :publish_article
      post :create, {:blog_engine_article => @article, :commit => "Publish"}
      response.should redirect_to blog_engine_articles_path
    end
    
    it "does not publish draft articles" do
      controller.should_not_receive :publish_article
      post :create, :blog_engine_article => @article
    end
  end
end