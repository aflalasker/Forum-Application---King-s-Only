class UsersCategories < ActiveRecord::Migration
  def change
    create_table :users_categories, :id => false do |t|
      t.integer "user_id"
      t.integer "category_id"
    end
    add_index :users_categories, ["user_id", "category_id"]
  end
end
