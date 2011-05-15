require "spec_helper"

describe "Making comments" do
  include Capybara
  include Rails.application.routes.url_helpers
  
  it "allows a user to make a comment" do
    pending 'Yet to implement'
    # an article is published
    # someone view the article
    # write a comment
    # and the submit it
    # sign up or sign in if not already
    # the comment is displayed
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
end