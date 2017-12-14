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
  
  test 'post has votes if they are assigned to it' do
        post = Post.new(content: 'content', topic_id: '1')
        post.save
        user = User.new(first_name: 'Alin', last_name: 'Fulga', email: 'a.f@kcl.ac.uk')
        user.save
        vote = Vote.new(user_id: user.id, post_id: post.id)
        vote.save
        assert post.votes.include?(vote)
   end
end
