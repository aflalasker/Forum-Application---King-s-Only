class Category < ActiveRecord::Base
    has_many :topics
    
    validates_presence_of :name
    validate_length_of :name, :maximum => 255
    
    scope :newest_first, lambda { order("categories.created_at DESC") }
    scope :search, lambda { |query|
    where(["name LIKE ?", "%#{query}%"])
    }
    
end
