# require "test_helper"

# class ViewForumFlowTest < ActionDispatch::IntegrationTest
#     test 'user sees all topics and posts' do
#         @user = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 1)
#         page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + " " + @user.first_name)
#         category = Category.create(name: "General Discussions")
#         topic = Topic.create(name: "General Topic", content: "General Content", category_id: category.id, user_id: @user.id)
#         post = Post.create(content: "General post content", topic_id: topic.id, user_id: @user.id)
#         category = Category.create(name: "Staff Administration")
#         topic = Topic.create(name: "Staff Topic", content: "Staff Content", category_id: category.id, user_id: @user.id)
#         post = Post.create(content: "Staff post content", topic_id: topic.id, user_id: @user.id)
#         visit '/categories/index'
#         click_link('General Discussions')
#         click_link('General Topic')
#         click_link('Back')
#         click_link('Back')
#         click_link('Staff Administration')
#         click_link('Staff Topic')
#         click_link('Back')
#         click_link('Back')
#         click_link('Log out')
#         assert has_button?('Login')
#     end
#     test 'user cannot vote twice' do
#         @user = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 1)
#         page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + " " + @user.first_name)
#         category = Category.create(name: "General Discussions")
#         topic = Topic.create(name: "General Topic", content: "General Content", category_id: category.id, user_id: @user.id)
#         post = Post.create(content: "General post content", topic_id: topic.id, user_id: @user.id)
#         category = Category.create(name: "Staff Administration")
#         topic = Topic.create(name: "Staff Topic", content: "Staff Content", category_id: category.id, user_id: @user.id)
#         post = Post.create(content: "Staff post content", topic_id: topic.id, user_id: @user.id)
#         visit '/categories/index'
#         click_link('General Discussions')
#         click_link('General Topic')
#         click_link('+')
#         assert_not has_link?('-')
#     end
#     test 'user can remove vote' do
#         @user = User.create(first_name: "Alin", last_name: "Fulga", email: "alin.fulga@kcl.ac.uk", role: 1)
#         page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + " " + @user.first_name)
#         category = Category.create(name: "General Discussions")
#         topic = Topic.create(name: "General Topic", content: "General Content", category_id: category.id, user_id: @user.id)
#         post = Post.create(content: "General post content", topic_id: topic.id, user_id: @user.id)
#         category = Category.create(name: "Staff Administration")
#         topic = Topic.create(name: "Staff Topic", content: "Staff Content", category_id: category.id, user_id: @user.id)
#         post = Post.create(content: "Staff post content", topic_id: topic.id, user_id: @user.id)
#         visit '/categories/index'
#         click_link('General Discussions')
#         click_link('General Topic')
#         click_link('-')
#         click_link('-')
#         assert has_link?('+')
#     end
# end
