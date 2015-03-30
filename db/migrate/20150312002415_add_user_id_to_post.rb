class AddUserIdToPost < ActiveRecord::Migration
  def add
    add_column :posts, :user_id, :interger
  end
end
