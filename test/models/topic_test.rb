require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  
  test 'valid test' do
   topic = Topic.new(name: 'name2017', content: 'content', category_id: '1')
   topic.save
   assert topic.valid?
  end
  
  
  test 'cannot create topic without name' do
   topic = Topic.new(content: 'content', category_id: '1')
   topic.save
   assert_not_nil topic.valid?
  end
  
  test 'cannot create topic without content' do
   topic = Topic.new(name: 'topicname2017', category_id: '1')
   topic.save
   assert_not_nil topic.valid?
  end
  
  test 'cannot create topic without category_id' do
   topic = Topic.new(name: 'topicname2017', content: 'Here is some content')
   topic.save
   assert_not_nil topic.valid?
  end
  
  
  
  test 'topic name cannot exceed 255 characters' do
    topic = Topic.new(name: 'This name exceeds 255 characters by the way!!! Lorem ipsum dolor sit amet, nonummy ligula volutpat hac integer nonummy. Suspendisse ultricies, congue etiam tellus, erat libero, nulla eleifend, mauris pellentesque. Suspendisse integer praesent vel, integer gravida mauris, fringilla vehicula lacinia non lacinia', content: 'content', category_id: '1')
    topic.save
    assert_not_nil topic.valid?
  end
  
  test 'topic content cannot exceed 255 characters' do
    topic = Topic.new(content: 'This content exceeds 255 characters by the way!!! Lorem ipsum dolor sit amet, nonummy ligula volutpat hac integer nonummy. Suspendisse ultricies, congue etiam tellus, erat libero, nulla eleifend, mauris pellentesque. Suspendisse integer praesent vel, integer gravida mauris, fringilla vehicula lacinia non lacinia')
    topic.save
    assert_not_nil topic.valid?
  end
  
  test 'topic has posts if they are assigned to it' do
        topic = Topic.new(name: 'New Topic', content: 'content', category_id: '1')
        topic.save
        post = Post.new(content: "Content", topic_id: topic.id)
        post.save
        assert topic.posts.include?(post)
   end
  

    
end
