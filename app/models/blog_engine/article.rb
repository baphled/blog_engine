require 'mongoid/markdown'

module BlogEngine
  class Article
    include Mongoid::Document
    include Mongoid::Markdown
    include Mongoid::Timestamps
    
    field :title
    field :content, :markdown => true
    
    has_and_belongs_to_many :categories, :class_name => 'BlogEngine::Category'
    
    validates_presence_of :title
  end
end