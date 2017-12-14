require 'test_helper'

class CategoryTest < ActiveSupport::TestCase   
   test 'valid category' do
     category = Category.new(name: 'Category name')
     assert category.save 
   end
   
   test 'category must have a name' do
     category = Category.new()
     assert_not category.save
   end
   
   test 'category name cannot exceed 128 characters' do
    @str = ""
    for i in 0...129
        @str << 's'
    end
    category = Category.new(name: @str)
    assert_not category.save
  end
   
   test 'category has topics if they are assigned to it' do
        category = Category.new(name: 'New Category')
        category.save
        topic = Topic.new(name: "New topic", content: "Content", category_id: category.id)
        topic.save
        assert category.topics.include?(topic)
   end
end
