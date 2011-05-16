module BlogEngine
  class Comment
    include Mongoid::Document
    include Mongoid::Markdown
    include Mongoid::Timestamps
    
    field :name
    field :body, :markdown => true
    
    embedded_in :article, :class_name => 'BlogEngine::Article'
    
    validates_presence_of :name, :body
    
  end
end