class Category < ActiveRecord::Base
  has_many :topics

  validates_presence_of :name
  validates_length_of :name, maximum: 128

  scope :sorted, -> { order('categories.created_at DESC') }
end
