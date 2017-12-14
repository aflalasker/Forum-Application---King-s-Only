require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'valid user' do
    user = User.new(first_name: 'Alin', last_name: 'Fulga', email: 'alin.fulga@kcl.ac.uk', role: 0)
    assert user.save
  end

  test 'invalid without first_name' do
    user = User.new(last_name: 'Fulga', email: 'alin.fulga@kcl.ac.uk', role: 0)
    assert_not user.save
  end
  
  test 'invalid without last_name' do
    user = User.new(first_name: 'Alin', email: 'alin.fulga@kcl.ac.uk', role: 1)
    assert_not user.save
  end

  test 'invalid without email' do
    user = User.new(first_name: 'Alin', last_name: 'Fulga', role: 1)
    assert_not user.save
  end
  
  test 'invalid without role' do
    user = User.new(first_name: 'Alin', last_name: 'Fulga', email: 'alin.fulga@kcl.ac.uk')
    assert_not user.save
  end
  
  
  test 'each users email must be unique' do
    user1 = User.new(first_name: 'Alin', last_name: 'Fulga', email: 'alin.fulga@kcl.ac.uk', role: 0)
    user1.save
    user2 = User.new(first_name: 'Alin', last_name: 'F', email: 'alin.fulga@kcl.ac.uk', role: 1)
    assert_not user2.save
  end
  
  
end

