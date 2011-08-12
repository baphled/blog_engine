require 'spec_helper'

describe "Author Admininstration" do
  include Capybara
  include Rails.application.routes.url_helpers
  
  it "allows us to create new categories" do
    create_author
    author_sign_in
    
    create_category 'My Category'
    
    visit new_blog_engine_article_path
    
    page.should have_content "Categories"
    page.should have_content "My Category"
  end
  
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