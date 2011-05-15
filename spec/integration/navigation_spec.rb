require 'spec_helper'

describe "Navigation" do
  include Capybara
  include Rails.application.routes.url_helpers
  
  it "should be a valid app" do
    ::Rails.application.should be_a(Dummy::Application)
  end
  
  context "creating a category" do
    before(:each) do
      @author = create_author
      author_sign_in
    end
    
    it "allows us to create new categories" do
      create_category 'My Category'
      
      visit new_blog_engine_article_path
      
      page.should have_content "Categories"
      page.should have_content "My Category"
    end
  end
  
  context "viewing collections of articles by tags" do
    it "does not include articles that are not publicised when generating the tag cloud"
  end
  
  context "viewing statistics on an article" do
    it "tracks the amount of unique views on an article"
    it "tracks the most searched for terms on the blog"
    it "tracks the most read articles"
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
    it "displays a chronological list of articles that are in that tag" do
      # two articles are published with the same tag
      @author = BlogEngine::Author.create!(:first_name => "Scooby", :last_name => "Doo", :email => Faker::Internet.email, :password => 'foobar')
      @articles = []
      2.times do |number|
        article = @author.articles.create!(
          :title => Faker::Lorem.sentence(1),
          :tags => 'edge rails',
          :content => Faker::Lorem.sentence(10),
          :published_at => Date.today,
          :published => true
        )
        article.should be_published
        @articles << article
      end
      
      # a user views the tag and sees two articles
      date = Date.today
      
      visit blog_engine_published_articles_by_tag_path(:tag => 'edge rails')
      page.should have_content 'edge rails'
    end

  end
end
