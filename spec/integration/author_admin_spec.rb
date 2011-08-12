require 'spec_helper'

describe "Author Admininstration" do
  include Capybara
  include Rails.application.routes.url_helpers
  
  context "menu" do
    before(:each) do
      create_author
      author_sign_in
    end
    
    it "allows an author to edit their account" do
      page.should have_content "Edit Account"
      click_link 'Edit Account'
      
      fill_in 'First name', :with => 'Scooby'
      fill_in 'Last name', :with => 'Doo'
      
      click_button 'Update'
    end
    
    it "allows a user to sign out" do
      page.should have_content "Log out"
      click_link 'Log out'
      
      page.should have_content "Signed out successfully."
      page.should_not have_selector :menu
    end

    it "allows me to manage my articles"
    it "allow me to view my drafted articles"
    it "allow me to view my published articles"
  end
end