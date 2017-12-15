require 'test_helper'

class StaffListTest < ActiveSupport::TestCase
  test 'email cannot exceed 100 characters' do
    @str = ''
    for i in 0...101
      @str << 's'
    end
    user = User.new(email: @str)
    assert_not user.save
  end
  
  test 'each staff member email must be unique' do
    user1 = User.new(first_name: 'Alin', last_name: 'Fulga', email: 'alin.fulga@kcl.ac.uk', role: 1)
    user1.save
    user2 = User.new(first_name: 'Alin', last_name: 'F', email: 'alin.fulga@kcl.ac.uk', role: 1)
    assert_not user2.save
  end
  
end
