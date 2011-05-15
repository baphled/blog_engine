require 'spec_helper'

describe BlogEngine::Article do
  before(:each) do
    @article = BlogEngine::Article.new
  end
  
  it "has a title" do
    @article.title = 'my title'
    @article.title.should_not be_nil
  end
  
  it "has content" do
    @article.content = 'my content'
    @article.content.should_not be_nil
  end
  
  it "has categories" do
    @article.categories.should be_empty
  end
  
  it "has tags" do
    @article.should respond_to :tags
  end
  
  it "has a slug" do
    @article.should respond_to :slug
  end
  
  it "must have an author"
  context "publishing an article" do
    before(:each) do
      @article.publicise
    end
    
    it "can be set to published" do
      @article.should be_published
    end
  
    it "has a published at date" do
      @article.should respond_to :published_at
    end
    
  end
  
  describe "markdown content" do
    it "should convert markdown to HTML" do
      @article.content = """
        gem install blog_engine
      """
      @article.content.should eql "<pre><code>    gem install blog_engine\n</code></pre>\n"
    end
  end
end