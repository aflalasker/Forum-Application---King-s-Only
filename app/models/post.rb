class Post < ActiveRecord::Base
    belongs_to :topic 
    
    after_save :touch_topic 
    
    validates_presence_of :content
    
    scope :sorted, lambda { order("posts.created_at DESC") }
    
    private
        def touch_topic
            topic.touch 
        end
end
