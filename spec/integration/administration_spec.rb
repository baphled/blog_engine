require 'spec_helper'

describe "Administration" do
  include Capybara
  include Rails.application.routes.url_helpers
  
  it "can set first created author as administrator"
  it "can use an adminsitrator class own the blog-engine"
  it "can allow to set the maintainer of the blog-engine"
  
  it "allows the blog-engine fat controller set groups"
  it "allows the fat controller to set permissions to groups"
  
  context "administration" do
    
    context "managing authors" do
      it "can create a new author"
      it "allows me to manage authors"
    end
    it "allows me to set search functionality"
    it "has collaboration settings"
    it "has statistics settings"
    it "has comments moderating setting"
    it "has pagination setting"
    it "has pagination limit"
  end
  
end