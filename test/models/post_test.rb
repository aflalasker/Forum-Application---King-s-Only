require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'valid post' do
    post = Post.new(topic_id: '1', content: 'Fulga')
    assert post.save
  end

  test 'post must have a topic_id' do
    post = Post.new(content: 'Fulga')
    assert_not post.save
  end

  test 'post must have content' do
    post = Post.new(topic_id: '1')
    assert_not post.save
  end

  test 'post content cannot exceed 10000 characters' do
    @str = ''
    for i in 0...10_001
      @str << 's'
    end
    post = Post.new(content: @str)
    assert_not post.save
  end

  test 'post has votes if they are assigned to it' do
    post = Post.new(content: 'content', topic_id: '1')
    post.save
    user = User.new(first_name: 'Alin', last_name: 'Fulga', email: 'a.f@kcl.ac.uk', role: 0)
    user.save
    vote = Vote.new(user_id: user.id, post_id: post.id, score: 1)
    vote.save
    assert post.votes.include?(vote)
  end
end
