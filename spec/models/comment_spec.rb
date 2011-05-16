require "spec_helper"

describe BlogEngine::Comment do
  before(:each) do
    @comment = BlogEngine::Comment.new
  end
  
  it "has a name" do
    @comment.should respond_to :name
  end
  
  it "has a body" do
    @comment.should respond_to :body
  end
  
  context "validations" do
    it "passes there is a body" do
      @comment.should be_invalid
    end
    
    it "fails if the body is empty" do
      @comment.should be_invalid
      @comment.errors_on(:body).should eql ["can't be blank"]
    end
    
    it "must have a commentor name" do
      @comment.should be_invalid
      @comment.errors_on(:name).should eql ["can't be blank"]
    end
  end
end