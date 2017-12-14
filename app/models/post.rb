class Post < ActiveRecord::Base
  belongs_to :topic
  has_many :votes

  before_validation :add_default_respect
  validates_presence_of :topic_id
  validates_presence_of :content
  validates_presence_of :content, maximum: 10000
  scope :sorted, -> { order('posts.created_at DESC') }

  private

  def add_default_respect
    self.respect = 0
  end
end
