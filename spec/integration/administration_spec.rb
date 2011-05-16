require 'spec_helper'

describe "Administration" do
  include Capybara
  include Rails.application.routes.url_helpers
  
  before(:each) do
    @author = create_author
    author_sign_in
  end
  
  it "can set first created author as administrator"
  it "can use an adminsitrator class own the blog-engine"
  it "can allow to set the maintainer of the blog-engine"
  
  it "allows the blog-engine fat controller set groups"
  it "allows the fat controller to set permissions to groups"
  
  context "administration" do
    it "allows us to create new categories" do
      create_category 'My Category'
      
      visit new_blog_engine_article_path
      
      page.should have_content "Categories"
      page.should have_content "My Category"
    end
    
    
    it "allows me to manage authors"
    it "allows me to set search functionality"
    it "has collaboration settings"
    it "has statistics settings"
    it "has comments moderating setting"
    it "has pagination setting"
    it "has pagination limit"
  end
  
end