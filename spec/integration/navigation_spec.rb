require 'spec_helper'

describe "Navigation" do
  include Capybara
  include Rails.application.routes.url_helpers
  
  it "should be a valid app" do
    ::Rails.application.should be_a(Dummy::Application)
  end
  
  context "creating a category" do
    before(:each) do
      @author = BlogEngine::Author.create!(:first_name => 'Scooby',
        :last_name => "Doo",
        :email => Faker::Internet.email,
        :password => 'foobar')
      visit 'authors/sign_in'
      fill_in 'Email', :with => @author.email
      fill_in 'Password', :with => @author.password

      click_button 'Sign in'
    end
    
    it "allows us to create new categories" do
      visit new_blog_engine_category_path
      
      fill_in 'Title', :with => 'My Category'
      
      click_button 'Save Category'
      
      visit new_blog_engine_article_path
      
      page.should have_content "Categories"
      page.should have_content "My Category"
    end
  end
  
  context "creating a drafted article as a signed in user" do
    
    before(:each) do
      @author = BlogEngine::Author.create!(:first_name => 'Scooby',
        :last_name => "Doo",
        :email => Faker::Internet.email,
        :password => 'foobar')
      
      visit 'authors/sign_in'
      fill_in 'Email', :with => @author.email
      fill_in 'Password', :with => @author.password
      
      click_button 'Sign in'
    end
    
    it "creating a new draft" do
      visit new_blog_engine_article_path
      
      fill_in 'Title', :with => 'My new article'
      fill_in 'Content', :with => """
      This is my article
      I love to write
      """
      
      click_button 'Save Draft'
      
      within("section#drafts") do
        page.should have_content "My new article"
      end
    end
    
    it "stores the authors name automatically" do
      visit new_blog_engine_article_path

      fill_in 'Title', :with => 'My new article'
      fill_in 'Content', :with => """
      This is my article
      I love to write
      """
      
      click_button 'Save Draft'
      
      within("section#drafts") do
        page.should have_content "Author"
        page.should have_content "Scooby Doo"
      end
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
      
      page.should have_content "My Category"
    end
    
    it "displays the articles tags" do
      visit new_blog_engine_category_path
      
      fill_in 'Title', :with => 'My Category'
      
      click_button 'Save Category'
      
      visit new_blog_engine_article_path
      
      fill_in 'Title', :with => 'My new article'
      fill_in 'Content', :with => 'This is my article'
      fill_in 'Tags', :with => 'my stuff, random'
      
      check 'My Category'
      
      click_button 'Save Draft'
      
      page.should have_content "my stuff, random"
    end
    
    it "has a link that contains the permalink" do
      visit new_blog_engine_category_path
      
      fill_in 'Title', :with => 'My Category'
      
      click_button 'Save Category'
      
      visit new_blog_engine_article_path
      
      fill_in 'Title', :with => 'My new article'
      fill_in 'Content', :with => 'This is my article'
      fill_in 'Tags', :with => 'my stuff, random'
      
      check 'My Category'
      
      click_button 'Publish'
      
      page.should have_content "My new article was published"
      
      date = Date.today
      visit blog_engine_published_article_path :year => date.year, :month => date.month, :date => date.day, :slug => 'my-new-article'
      page.should have_content "My new article"
    end
    
    it "redirects me if the I try to view the article directly" do
      pending 'Yet to implement'
      visit new_blog_engine_category_path
      
      fill_in 'Title', :with => 'My Category'
      
      click_button 'Save Category'
      
      visit new_blog_engine_article_path
      
      fill_in 'Title', :with => 'My new article'
      fill_in 'Content', :with => 'This is my article'
      fill_in 'Tags', :with => 'my stuff, random'
      
      check 'My Category'
      
      click_button 'Save Draft'
      
      visit blog_engine_published_article_path :slug => 'my-new-article'
      
      # Should get a 404
    end
    
    it "it displays drafts in the drafts section" do
      visit new_blog_engine_category_path
      
      fill_in 'Title', :with => 'My Category'
      
      click_button 'Save Category'
      
      visit new_blog_engine_article_path
      
      fill_in 'Title', :with => 'My new article'
      fill_in 'Content', :with => 'This is my article'
      fill_in 'Tags', :with => 'my stuff, random'
      
      check 'My Category'
      
      click_button 'Save Draft'
      
      within("section#drafts") do
        page.should have_content "My new article"
      end
    end
    
    it "displays published articles in the published section" do
      visit new_blog_engine_category_path
      
      fill_in 'Title', :with => 'My Category'
      
      click_button 'Save Category'
      
      visit new_blog_engine_article_path
      
      fill_in 'Title', :with => 'My new article'
      fill_in 'Content', :with => 'This is my article'
      fill_in 'Tags', :with => 'my stuff, random'
      
      check 'My Category'
      
      click_button 'Publish'
      
      within("section#published") do
        page.should have_content "My new article"
      end
    end
    
    it "does not display drafts until they are published"
    it "can set an articles publication date"
    it "should use gists to code examples"
  end
  
  context "draft versions" do
    it "can not be viewed by guest users"
    it "does not display drafts on the main page"
    it "allows us to version our draft"
    it "overwrites as the current draft with a previous version"
  end
  
  context "editing an article" do
    it "should allow me to preview the article"
  end
  
  context "published articles" do
    it "does not display an article until it is published"
    it "published articles perma-link can not change"
  end
  
  context "displaying articles with a given year and month" do
    it "displays all found published articles"
  end
  
  context "displaying articles with a given category" do
    it "displays a chronological list of articles that are in that category"
  end
  
  context "displaying articles with a given tag" do
    it "displays a chronological list of articles that are in that tag"
  end
end
