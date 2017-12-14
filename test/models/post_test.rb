require 'test_helper'

class PostTest < ActiveSupport::TestCase
   
   test 'valid post' do
    post = Post.new(topic_id: '1', content: 'Fulga')
    assert post.valid?
  end
  
  test 'post must have a topic_id' do
    post = Post.new(content: 'Fulga')
    assert_not_nil post.valid?
  end
  
  test 'post must have content' do
    post = Post.new(topic_id: '1')
    assert_not_nil post.valid?
  end
end
