require 'mongoid/markdown'

module BlogEngine
  class Article
    include Mongoid::Document
    include Mongoid::Markdown
    include Mongoid::Timestamps
    include Mongoid::Taggable
    
    field :title
    field :content, :markdown => true
    
    has_and_belongs_to_many :categories, :class_name => 'BlogEngine::Category'
    tags_separator ', '
    validates_presence_of :title
  end
end