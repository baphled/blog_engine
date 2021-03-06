require 'mongoid/markdown'

module BlogEngine
  class Article
    include Mongoid::Document
    include Mongoid::Markdown
    include Mongoid::Timestamps
    include Mongoid::Taggable
    include Mongoid::Slug
    
    field :title
    field :content, :markdown => true
    field :published_at, :type => Date
    field :published, :type => Boolean, :default => false
    
    attr_reader :published
    
    slug :title
        
    has_and_belongs_to_many :categories, :class_name => 'BlogEngine::Category'
    belongs_to :author, :class_name => 'BlogEngine::Author'
    
    tags_separator ', '
    
    validates_presence_of :title, :author
    validates_format_of :tags, with: /^[a-zA-Z0-9,\s+]+$/, :allow_blank => true
    
    scope :drafts, where(:published => false).order_by(:published_at.desc)
    scope :publicised, where(:published => true).order_by(:published_at.desc)
    
    def self.published?
      self.published
    end
    
    def publicise
      self.published_at = Date.today
      self.published = true
    end
  end
end