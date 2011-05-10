require 'spec_helper'

describe "Navigation" do
  include Capybara
  
  it "should be a valid app" do
    ::Rails.application.should be_a(Dummy::Application)
  end
  
  context "creating an article as a signed in user" do
    
    it "creating a new draft" do
      pending 'Yet to implement'
      # sign in
      # visit articles page
      # fill in title
      # fill in content
      # add tags
      # save draft
      # displayed as a draft
    end
    
    it "allows us to create new categories"
    it "can set an articles category"
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
