class Post < ActiveRecord::Base
  belongs_to :topic # A post belongs to a topic
  has_many :votes # A post has many votes

  before_validation :add_default_respect
  validates_presence_of :topic_id # Topic id is mandatory
  validates_presence_of :content, maximum: 10000 # Maximum length of content is 10000
  scope :sorted, -> { order('posts.created_at ASC') } # Sort by creation date

  private
  # Initialise respect with 0
  def add_default_respect
    self.respect = 0
  end
end
