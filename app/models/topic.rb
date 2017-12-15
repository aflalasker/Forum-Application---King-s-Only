class Topic < ActiveRecord::Base
  belongs_to :category # A topic belongs to a category
  has_many :posts # A topic has many posts

  validates_presence_of :category_id # Category id is mandatory
  validates_presence_of :name, maximum: 128 # Name is mandatory, maximum length is 128
  validates_presence_of :content, maximum: 10000 # Content is mandatory, maximum length is 10000
  scope :sorted, -> { order('topics.created_at ASC') } # Topics are sorted by creation date
end
