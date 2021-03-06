require 'spec_helper'

describe "Viewing articles as a guest" do
  include Capybara
  include Rails.application.routes.url_helpers
  
  context "no articles present" do
    it "displays a message stating there are no articles on the articles page" do
      visit blog_engine_published_articles_path
      page.should have_content "We currently have no articles published, please check again later."
    end
  end
  
  context "viewing articles" do
    it "shows me a list of published articles" do
      pending 'Not yet implemented'
      # an author publishes 3 articles
      create_author
      author_sign_in
      create_category 'My Category'
      3.times do |article|
        publish_article "my article #{article}"
      end
      author_sign_out
      
      # a guest views the blog index
      visit blog_engine_path
      # the guest can only see 3 articles
    end
    
    it "show display a list of created categories"
    it "each category should have a count of the number of articles posted in it"
    it "should paginate articles if there are more than 'x'"
  end
  
  it "can not view drafted articles"
  it "can not see tags for articles that are not published yet"
  it "has no access to the articles administration panel"
  it "allows me to easy view the most popular tag"
  it "allows me to view articles by year"
  it "allows me to view articles by month"
  it "allows me to view articles by day"
  
  context "searching" do
    it "allows me to search based on tags"
    it "allows me to search based on categories"
    it "allows me to search based on author"
  end
end