require "spec_helper"

describe BlogEngine::Category do
  before(:each) do
    @category = BlogEngine::Category.new
  end
  it "has a title" do
    @category.should respond_to :title
  end
  
  context "validations" do
    it "passes if there are more than one word" do
      @category.title = 'rails 3'
      @category.should_not be_invalid
    end
    
    it "is invalid if a '.' is in the title" do
      @category.title = 'rails 3.1'
      @category.should be_invalid
      @category.errors_on(:title).should eql ['is invalid']
    end
  end
end