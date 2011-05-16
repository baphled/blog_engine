require 'spec_helper'

describe "Viewing articles as a guest" do
  include Capybara
  include Rails.application.routes.url_helpers
  
  context "viewing articles" do
    it "shows me a list of published articles"
    it "show display a list of created categories"
    it "each category should have a count of the number of articles posted in it"
    it "should paginate articles if there are more than 'x'"
  end
  
  it "can not view drafted articles"
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