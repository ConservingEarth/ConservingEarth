class AddUserIdToPost < ActiveRecord::Migration
  def add
    add_column :videos, :user_id, :integer
    add_index :videos, :user_id
  end
end
