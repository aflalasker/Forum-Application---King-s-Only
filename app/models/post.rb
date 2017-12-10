class Post < ActiveRecord::Base
    belongs_to :topic 
    validates_presence_of :topic_id
    validates_presence_of :content
    
    scope :sorted, lambda { order("posts.created_at DESC") }

end
