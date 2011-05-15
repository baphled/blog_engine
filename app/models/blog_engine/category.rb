module BlogEngine
  class Category
    include Mongoid::Document
    
    field :title
    
    has_and_belongs_to_many :articles, :class_name => 'BlogEngine::Article'
    
    validates_format_of :title, with: /^[a-zA-Z0-9\s+]+$/
  end
end