require 'test_helper'

class StaffListTest < ActiveSupport::TestCase
  test 'email cannot exceed 100 characters' do
    @str = ""
    for i in 0...101
        @str << 's'
    end
    user = User.new(email: @str)
    assert_not user.save
  end
end
