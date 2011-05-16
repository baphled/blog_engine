require 'spec_helper'

describe "Author Admininstration" do
  include Capybara
  include Rails.application.routes.url_helpers
  
  before(:each) do
    @author = create_author
    author_sign_in
  end
  
  context "menu" do
    it "allows me to sign out"
    it "allows me to manage my articles"
    it "allow me to view my drafted articles"
    it "allow me to view my published articles"
  end
end