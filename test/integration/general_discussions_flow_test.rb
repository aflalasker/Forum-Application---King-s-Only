require 'test_helper'

class GeneralDiscussionsFlowTest < ActionDispatch::IntegrationTest
  test 'can create topic' do
    Category.create(name: 'General Discussions')
    @user = User.create(first_name: 'Alin', last_name: 'Fulga', email: 'alin.fulga@kcl.ac.uk', role: 0)
    page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + ' ' + @user.first_name)
    visit '/categories/index'
    find_link('General Discussions').click
    find_link('Start New Topic').click
    fill_in 'topic_name', with: 'First topic'
    fill_in 'topic_name', with: 'Topic content'
    find('input[name="commit"]').click
    save_and_open_page
    print page.html
  end
end
