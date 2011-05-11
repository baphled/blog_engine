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
  
  describe "markdown content" do
    it "should convert markdown to HTML" do
      @article.content = """
        gem install blog_engine
      """
      @article.content.should eql "<pre><code>    gem install blog_engine\n</code></pre>\n"
    end
  end
end