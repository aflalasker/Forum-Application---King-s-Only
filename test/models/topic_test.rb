require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  test 'valid test' do
    topic = Topic.new(name: 'name2017', content: 'content', category_id: '1')
    assert topic.save
  end

  test 'cannot create topic without name' do
    topic = Topic.new(content: 'content', category_id: '1')
    assert_not topic.save
  end

  test 'cannot create topic without content' do
    topic = Topic.new(name: 'topicname2017', category_id: '1')
    assert_not topic.save
  end

  test 'cannot create topic without category_id' do
    topic = Topic.new(name: 'topicname2017', content: 'Here is some content')
    assert_not topic.save
  end

  test 'topic name cannot exceed 128 characters' do
    @str = ''
    for i in 0...129
      @str << 's'
    end
    topic = Topic.new(name: @str)
    assert_not topic.save
  end

  test 'topic content cannot exceed 10000 characters' do
    @str = ''
    for i in 0...10_001
      @str << 's'
    end
    topic = Topic.new(content: @str)
    assert_not topic.save
  end

  test 'topic has posts if they are assigned to it' do
    topic = Topic.new(name: 'New Topic', content: 'content', category_id: '1')
    topic.save
    post = Post.new(content: 'Content', topic_id: topic.id)
    post.save
    assert topic.posts.include?(post)
  end
end
