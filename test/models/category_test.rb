require 'test_helper'

class CategoryTest < ActiveSupport::TestCase   
   test 'valid category' do
     category = Category.new(name: 'Category name')
     assert category.valid? 
   end
   
   test 'category must have a name' do
     category = Category.new()
     assert_not_nil category.valid? 
   end
   
   test 'category name must not exceed 255 characters' do
     category = Category.new(name: 'This exceeds 255 characters!!! Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. ')
     assert_not_nil category.valid? 
   end
   
   test 'category has topics if they are assigned to it' do
        category = Category.new(name: 'New Category')
        category.save
        topic = Topic.new(name: "New topic", content: "Content", category_id: category.id)
        topic.save
        assert category.topics.include?(topic)
   end
end
