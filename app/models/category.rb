class Category < ActiveRecord::Base
  has_many :topics # A category has many topics

  validates_presence_of :name # Name is mandatory
  validates_length_of :name, maximum: 128 # Maximum length of name is 128

  scope :sorted, -> { order('categories.created_at ASC') } # Sort by creation date
end
