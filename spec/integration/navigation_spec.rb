require 'spec_helper'

describe "Navigation" do
  include Capybara
  include Rails.application.routes.url_helpers
  
  it "should be a valid app" do
    ::Rails.application.should be_a(Dummy::Application)
  end
  
  context "creating an article as a signed in user" do
    
    before(:each) do
      @author = Author.create(:email => Faker::Internet.email, :password => 'foobar')
      visit 'authors/sign_in'
      fill_in 'Email', :with => @author.email
      fill_in 'Password', :with => @author.password

      click_button 'Sign in'
    end
    
    it "creating a new draft" do
      visit new_blog_engine_article_path

      fill_in 'Title', :with => 'My new article'
      fill_in 'Content', :with => '<p>This is my article</p><p>I love to write</p>'
      
      click_button 'Save Draft'
      
      page.should have_content "My new article"
      page.should have_content "This is my article"
      page.should have_content "I love to write"
    end
    
    it "allows us to create new categories" do
      visit new_blog_engine_category_path
      
      fill_in 'Title', :with => 'My Category'
      
      click_button 'Save Category'
      
      visit new_blog_engine_article_path
      
      page.should have_content "Categories"
      page.should have_content "My Category"
    end
    
    it "can set an articles category" do
      visit new_blog_engine_category_path
      
      fill_in 'Title', :with => 'My Category'
      
      click_button 'Save Category'
      
      visit new_blog_engine_article_path
      
      fill_in 'Title', :with => 'My new article'
      fill_in 'Content', :with => 'This is my article'
      
      check 'My Category'
      
      click_button 'Save Draft'
      save_and_open_page
      page.should have_content "Categories:"
      page.should have_content "My Category"
    end
    
    it "displays the articles tags"
    it "can set an articles publication date"
  end
  
  context "editing an article" do
    it "should allow me to preview the article"
    it "should use markdown for the content body"
    it "should use gists to code examples"
  end
  
  context "published articles" do
    it "has a perma-link that can not be changed"
    it "link contains the permalink"
    it "link contains the date it was published"
  end
  
  context "displaying articles with a given category" do
    it "displays a chronological list of articles that are in that category"
  end
  
  context "displaying articles with a given tag" do
    it "displays a chronological list of articles that are in that tag"
  end
end
