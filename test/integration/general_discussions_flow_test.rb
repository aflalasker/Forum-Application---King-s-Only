require 'test_helper'

class GeneralDiscussionsFlowTest < ActionDispatch::IntegrationTest
  test 'can create topic' do
      @user = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + " " + @user.first_name)
      category = Category.create(name: "General Discussions")
      Topic.create(name: "General Topic", content: "General Content", category_id: category.id, user_id: @user.id)
      visit '/categories/index'
      click_link('General Discussions')
      assert has_link?('Start New Topic')
  end
  test 'can edit topic' do
      @user = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + " " + @user.first_name)
      category = Category.create(name: "General Discussions")
      Topic.create(name: "General Topic", content: "General Content", category_id: category.id, user_id: @user.id)
      visit '/categories/index'
      click_link('General Discussions')
      assert has_link?('Edit')
  end
  test 'can edit any topic from student category if staff' do
      @user2 = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      @user = User.create(first_name: "Jeroen", last_name: "Keppens", email: "jeroen.keppens@kcl.ac.uk", role: 1)
      page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + " " + @user.first_name, role: 1)
      category = Category.create(name: "General Discussions")
      Topic.create(name: "General Topic", content: "General Content", category_id: category.id, user_id: @user2.id)
      visit '/categories/index'
      click_link('General Discussions')
      assert has_link?('Edit')
  end
  test 'can delete topic' do
      @user = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + " " + @user.first_name)
      category = Category.create(name: "General Discussions")
      Topic.create(name: "General Topic", content: "General Content", category_id: category.id, user_id: @user.id)
      visit '/categories/index'
      click_link('General Discussions')
      assert has_link?('Delete')
  end
  test 'can delete any topic from student category if staff' do
      @user2 = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      @user = User.create(first_name: "Jeroen", last_name: "Keppens", email: "jeroen.keppens@kcl.ac.uk", role: 1)
      page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + " " + @user.first_name, role: 1)
      category = Category.create(name: "General Discussions")
      Topic.create(name: "General Topic", content: "General Content", category_id: category.id, user_id: @user2.id)
      visit '/categories/index'
      click_link('General Discussions')
      assert has_link?('Delete')
  end
  test 'can reply to topic' do
      @user = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + " " + @user.first_name)
      category = Category.create(name: "General Discussions")
      topic = Topic.create(name: "General Topic", content: "General Content", category_id: category.id, user_id: @user.id)
      Post.create(content: "General post content", topic_id: topic.id, user_id: @user.id)
      visit '/categories/index'
      click_link('General Discussions')
      click_link('General Topic')
      assert has_link?('New post')
  end
  test 'can edit post' do
      @user = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + " " + @user.first_name)
      category = Category.create(name: "General Discussions")
      topic = Topic.create(name: "General Topic", content: "General Content", category_id: category.id, user_id: @user.id)
      Post.create(content: "General post content", topic_id: topic.id, user_id: @user.id)
      visit '/categories/index'
      click_link('General Discussions')
      click_link('General Topic')
      assert has_link?('Edit')
  end
  test 'can delete post' do
      @user = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + " " + @user.first_name)
      category = Category.create(name: "General Discussions")
      topic = Topic.create(name: "General Topic", content: "General Content", category_id: category.id, user_id: @user.id)
      Post.create(content: "General post content", topic_id: topic.id, user_id: @user.id)
      visit '/categories/index'
      click_link('General Discussions')
      click_link('General Topic')
      assert has_link?('Delete')
  end
  test 'can edit student post if staff' do
      @user2 = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      @user = User.create(first_name: "Jeroen", last_name: "Keppens", email: "jeroen.keppens@kcl.ac.uk", role: 1)
      page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + " " + @user.first_name, role: 1)
      category = Category.create(name: "General Discussions")
      topic = Topic.create(name: "General Topic", content: "General Content", category_id: category.id, user_id: @user2.id)
      Post.create(content: "General post content", topic_id: topic.id, user_id: @user2.id)
      visit '/categories/index'
      click_link('General Discussions')
      click_link('General Topic')
      assert has_link?('Edit')
  end
  test 'can delete student post if staff' do
      @user2 = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      @user = User.create(first_name: "Jeroen", last_name: "Keppens", email: "jeroen.keppens@kcl.ac.uk", role: 1)
      page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + " " + @user.first_name, role: 1)
      category = Category.create(name: "General Discussions")
      topic = Topic.create(name: "General Topic", content: "General Content", category_id: category.id, user_id: @user2.id)
      Post.create(content: "General post content", topic_id: topic.id, user_id: @user2.id)
      visit '/categories/index'
      click_link('General Discussions')
      click_link('General Topic')
      assert has_link?('Delete')
  end
end
