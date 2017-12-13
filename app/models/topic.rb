class Topic < ActiveRecord::Base
  belongs_to :category
  has_many :posts

  before_validation :add_default_respect

  validates_presence_of :name
  validates_presence_of :content
  validates_presence_of :category_id
  validates_presence_of :name, maximum: 255
  validates_presence_of :content, maximum: 255
  scope :sorted, -> { order('topics.created_at DESC') }

  private

  def add_default_respect
    self.respect = 0
  end
end
