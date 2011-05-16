require 'spec_helper'

describe "Publishing articles" do
  include Capybara
  include Rails.application.routes.url_helpers
  
  before(:each) do
    @author = create_author
    author_sign_in
  end
  
  it "displays published articles in the published section" do
    create_category 'My Category'
    publish_article
    
    within("section#published") do
      page.should have_content "My new article"
    end
  end
  
  it "has a link that contains the permalink" do
    create_category 'My Category'
    publish_article
    
    page.should have_content "My new article was published"
    
    date = Date.today
    visit blog_engine_published_article_path(
      :year => date.year, :month => date.month, :date => date.day, :slug => 'my-new-article'
    )
    page.should have_content "My new article"
  end
  
  it "does not display an article until it is published"
  it "published articles perma-link can not change"
  it "should be able to set a publish date on drafted articles"
end