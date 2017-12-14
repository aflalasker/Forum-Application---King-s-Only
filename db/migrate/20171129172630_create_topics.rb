class CreateTopics < ActiveRecord::Migration
  def up
    create_table :topics do |t|
      t.integer 'category_id'
      t.integer 'user_id'
      t.string 'name'
      t.string 'content'
      t.timestamps
    end
    add_index('topics', 'category_id')
    add_index('topics', 'user_id')
  end

  def down
    drop_table :topics
  end
end
