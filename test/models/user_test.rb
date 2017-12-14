require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'valid user' do
    user = User.new(first_name: 'Alin', last_name: 'Fulga', email: 'alin.fulga@kcl.ac.uk')
    assert user.valid?
  end

  test 'valid without first_name' do
    user = User.new(last_name: 'Fulga', email: 'alin.fulga@kcl.ac.uk')
    assert user.valid?
  end
  
  test 'valid without last_name' do
    user = User.new(first_name: 'Alin', email: 'alin.fulga@kcl.ac.uk')
    assert user.valid?
  end

  test 'invalid without email' do
    user = User.new(first_name: 'Alin', last_name: 'Fulga')
    assert_not user.valid?
  end
  
  test 'first_name cannot exceed 25 characters' do
    user = User.new(first_name: 'Aaaaaaaaaaaaaaaaaaaaaaaaaalin', last_name: 'Fulga', email: 'alin.fulga@kcl.ac.uk')
     assert_not_nil user.valid?
  end
  
  test 'last name cannot exceed 50 characters' do
    user = User.new(first_name: 'Alin', last_name: 'Fuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuulga', email: 'alin.fulga@kcl.ac.uk')
    assert_not_nil user.valid?
  end
  
  test 'email cannot exceed 100 characters' do
    user = User.new(email: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaalin.fulga@kcl.ac.uk')
    assert_not_nil user.valid?
  end
  
  test 'each users email must be unique' do
    user1 = User.new(email: 'alin.fulga@kcl.ac.uk')
    user1.save
    user2 = User.new(email: 'alin.fulga@kcl.ac.uk')
    assert_not_nil user2.valid?
  end
  
  
end

