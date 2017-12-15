require 'test_helper'
require 'rack_session_access/capybara'

class LoginFlowTest < ActionDispatch::IntegrationTest
  test 'can logout if logged in' do
    @user = User.create(first_name: 'Alin', last_name: 'Fulga', email: 'alin.fulga@kcl.ac.uk', role: 0)
    page.set_rack_session(id: @user.id, email: @user.email, name: @user.last_name + ' ' + @user.first_name)
    visit '/categories/index'
    click_link('Log out')
    assert has_button?('Login')
  end
end