require 'spec_helper'

describe BlogEngine::CategoriesController do
  describe "GET, new" do

    it "gets a new category" do
      BlogEngine::Category.should_receive :new
      get :new
    end
  end
  
  describe "POST, create" do
    before(:each) do
      @category = BlogEngine::Category.new :title => "My category"
      BlogEngine::Category.stub(:new).and_return @category
    end
    
    it "create a new category instance" do
      BlogEngine::Category.should_receive :new
      post :create, :blog_engine_category => @category
    end
    
    it "saves the category" do
      @category.should_receive :save
      post :create, :blog_engine_category => @category
    end
  end
end