require 'test_helper'

class VoteTest < ActiveSupport::TestCase
   test 'valid vote' do
    vote = Vote.new(post_id: '1', user_id: '1', score: '-1')
     assert vote.valid?
   end
   
   test 'vote requires a post_id' do
    vote = Vote.new(user_id: '1', score: '-1')
    assert_not vote.valid?
    end
    
    test 'vote requires a user_id' do
    vote = Vote.new(post_id: '1', score: '-1')
    assert_not vote.valid?
    end

    test 'vote belongs to a post' do
    post = Post.new(topic_id: '1', content: 'Fulga')
    post.save
    vote = Vote.new(user_id: '1', post_id: post.id, score: '-1')
    assert vote.valid?
    end
    
    test 'vote belongs to a user' do
    user = User.new(first_name: 'Alin', last_name: 'Fulga', email: 'alin.fulga@kcl.ac.uk', role: 0)
    user.save
    vote = Vote.new(user_id: user.id, post_id: '1', score: '-1')
    assert vote.valid?
    end
end
