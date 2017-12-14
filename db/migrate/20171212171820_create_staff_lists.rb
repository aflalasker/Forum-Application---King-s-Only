class CreateStaffLists < ActiveRecord::Migration
  def change
    create_table :staff_lists do |t|
      t.string 'email', default: '', null: false, limit: 100
      t.timestamp
    end
    add_index 'staff_lists', 'email', :unique => true
  end
end
