require 'test_helper'

class StaffAnnouncementsFlowTest < ActionDispatch::IntegrationTest
  test 'cannot create topic if student' do
      @user2 = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      @user = User.create(first_name: "Jeroen", last_name: "Keppens", email: "jeroen.keppens@kcl.ac.uk", role: 1)
      page.set_rack_session(id: @user2.id, email: @user2.email, name: @user2.last_name + " " + @user2.first_name)
      category = Category.create(name: "Staff Announcements")
      Topic.create(name: "Staff Topic", content: "Staff content", category_id: category.id, user_id: @user.id)
      visit '/categories/index'
      click_link('Staff Announcements')
      assert_not has_link?('Start New Topic')
  end
  test 'cannot edit topic if student' do
      @user2 = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      @user = User.create(first_name: "Jeroen", last_name: "Keppens", email: "jeroen.keppens@kcl.ac.uk", role: 1)
      page.set_rack_session(id: @user2.id, email: @user2.email, name: @user2.last_name + " " + @user2.first_name)
      category = Category.create(name: "Staff Announcements")
      Topic.create(name: "Staff Topic", content: "Staff content", category_id: category.id, user_id: @user.id)
      visit '/categories/index'
      click_link('Staff Announcements')
      assert_not has_link?('Edit')
  end
  test 'cannot delete topic if student' do
      @user2 = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      @user = User.create(first_name: "Jeroen", last_name: "Keppens", email: "jeroen.keppens@kcl.ac.uk", role: 1)
      page.set_rack_session(id: @user2.id, email: @user2.email, name: @user2.last_name + " " + @user2.first_name)
      category = Category.create(name: "Staff Announcements")
      Topic.create(name: "Staff Topic", content: "Staff content", category_id: category.id, user_id: @user.id)
      visit '/categories/index'
      click_link('Staff Announcements')
      assert_not has_link?('Delete')
  end
  test 'cannot reply to topic if student' do
      @user2 = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      @user = User.create(first_name: "Jeroen", last_name: "Keppens", email: "jeroen.keppens@kcl.ac.uk", role: 1)
      page.set_rack_session(id: @user2.id, email: @user2.email, name: @user2.last_name + " " + @user2.first_name)
      category = Category.create(name: "Staff Announcements")
      topic = Topic.create(name: "Staff Topic", content: "Staff content", category_id: category.id, user_id: @user.id)
      Post.create(content: "Staff post content", topic_id: topic.id, user_id: @user.id)
      visit '/categories/index'
      click_link('Staff Announcements')
      click_link('Staff Topic')
      assert_not has_link?('New post')
  end
  test 'cannot edit post if student' do
      @user2 = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      @user = User.create(first_name: "Jeroen", last_name: "Keppens", email: "jeroen.keppens@kcl.ac.uk", role: 1)
      page.set_rack_session(id: @user2.id, email: @user2.email, name: @user2.last_name + " " + @user2.first_name)
      category = Category.create(name: "Staff Announcements")
      topic = Topic.create(name: "Staff Topic", content: "Staff content", category_id: category.id, user_id: @user.id)
      Post.create(content: "Staff post content", topic_id: topic.id, user_id: @user.id)
      visit '/categories/index'
      click_link('Staff Announcements')
      click_link('Staff Topic')
      assert_not has_link?('Edit')
  end
  test 'cannot delete post if student' do
      @user2 = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 0)
      @user = User.create(first_name: "Jeroen", last_name: "Keppens", email: "jeroen.keppens@kcl.ac.uk", role: 1)
      page.set_rack_session(id: @user2.id, email: @user2.email, name: @user2.last_name + " " + @user2.first_name)
      category = Category.create(name: "Staff Announcements")
      topic = Topic.create(name: "Staff Topic", content: "Staff content", category_id: category.id, user_id: @user.id)
      Post.create(content: "Staff post content", topic_id: topic.id, user_id: @user.id)
      visit '/categories/index'
      click_link('Staff Announcements')
      click_link('Staff Topic')
      assert_not has_link?('Delete')
  end
end
