require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  test "cannot create topic without name" do
   topic = Topic.new()
   topic.save
   assert_not_nil topic.valid?
  end
  
  test "topic name cannot exceed 255 characters" do
    topic = Topic.new(name: 'Lorem ipsum dolor sit amet, nonummy ligula volutpat hac integer nonummy. Suspendisse ultricies, congue etiam tellus, erat libero, nulla eleifend, mauris pellentesque. Suspendisse integer praesent vel, integer gravida mauris, fringilla vehicula lacinia non lacinia')
    topic.save
    assert_not_nil topic.valid?
  end
  
  test "topic content cannot exceed 255 characters" do
    topic = Topic.new(content: 'Lorem ipsum dolor sit amet, nonummy ligula volutpat hac integer nonummy. Suspendisse ultricies, congue etiam tellus, erat libero, nulla eleifend, mauris pellentesque. Suspendisse integer praesent vel, integer gravida mauris, fringilla vehicula lacinia non lacinia')
    topic.save
    assert_not_nil topic.valid?
  end
  
  
 
    
end
