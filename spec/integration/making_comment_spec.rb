require "spec_helper"

describe "Making comments" do
  include Capybara
  include Rails.application.routes.url_helpers
  
  it "allows a user to make a comment" do
    # an article is published
    @author = create_author
    author_sign_in
    publish_article 'article'
    
    # someone view the article
    date = Date.today
    visit blog_engine_published_article_path(
      :year => date.year, :month => date.month, :date => date.day, :slug => 'article'
    )
    # write a comment
    fill_in 'Name', :with => 'Scooby Doo'
    fill_in 'Body', :with => 'I really like this article'
    
    # and the submit it
    click_button 'Create Comment'
    
    # the comment is displayed
    page.should have_content "Comment has been added to 'article'"
    page.should have_content "I really like this article"
  end
  
  it "allows authors to mediate comments"
  
  it "comments are displayed dynamically" do
    pending 'Yet to implement'
    # an article is published
    # someone writes a comment
    # and they submit it
    # I am viewing the article
    # the comment is displayed
  end
  
  it "allows a comment to be nested within another comment" do
    pending 'Yet to implement'
    # an article is published
    # someone writes a comment
    # and they submit it
    # I am viewing the article
    # the comment is displayed
    # i reply to the comment
    # and the response is displayed
  end
  
  context "managing comments" do
    it "allows authors to moderate comments"
  end
end