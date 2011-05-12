module BlogEngine
  class Author
    include Mongoid::Document
    # Include default devise modules. Others available are:
    # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    field :first_name
    field :last_name
    
    has_many :articles, :class_name => 'BlogEngine::Article'
    
    def full_name
      "#{self.first_name} #{self.last_name}"
    end
  end
end