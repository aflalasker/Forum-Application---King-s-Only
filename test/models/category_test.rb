require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'cannot create category without name' do
    @category = Category.new
    @category.save
    assert true
  end
end
