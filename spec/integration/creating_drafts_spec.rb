require 'spec_helper'

describe "Creating drafts" do
  include Capybara
  include Rails.application.routes.url_helpers
    
  context "editing an article" do
    it "should allow me to preview the article"
  end
  
  context "creating a drafted article" do
    before(:each) do
      @author = create_author
      author_sign_in
    end
    
    it "creating a new draft" do
      submit_draft "My new article", """
      This is my article
      I love to write
      """
      
      within("section#drafts") do
        page.should have_content "My new article"
      end
    end
    
    it "stores the authors name automatically" do
      submit_draft
      
      within("section#drafts") do
        page.should have_content "Author"
        page.should have_content @author.full_name
      end
    end
    
    it "can set an articles category" do
      create_category 'My Category'
      submit_draft "My new article", "This is my blog", nil, 'My Category'
            
      page.should have_content "My Category"
    end
    
    it "displays the articles tags" do
      submit_draft "My new article", "This is my blog", 'my stuff, random'
      
      page.should have_content "my stuff, random"
    end
    
    it "it displays drafts in the drafts section" do
      create_category 'My Category'
      submit_draft 'My new article'
      
      within("section#drafts") do
        page.should have_content "My new article"
      end
    end
        
    it "only allows tags with alphanumeric values and split by commas" do
      create_category 'My Category'
      submit_draft 'My new article', 'This is my content', 'rails 3.1'
      
      within('div.field_with_errors span.error') do
        page.should have_content "is invalid"
      end
    end
    
    it "does not display drafts until they are published" do
      create_category 'My Category'
      submit_draft
      
      page.should have_content "Created new draft"
      
      date = Date.today
      lambda {
        visit blog_engine_published_article_path(
          :year => date.year, :month => date.month, :date => date.day, :slug => 'my-new-article'
        )
      }.should raise_error(ActionController::RoutingError)
    end
    
    it "can set an articles publication date"
    it "should use gists to code examples"
  end
  
  context "draft versioning" do
    it "allows us to version our draft"
    it "does not display drafts on the main page"
    it "allows us to version our draft"
    it "overwrites as the current draft with a previous version"

  end
  
  context "collaborating with others" do
    it "allows authors to invite others to collaborate on an article"
    it "allows originating authors to remove collaborators"
  end
end