class CreatePosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.string :title
      t.string :link
      t.text :body

      t.timestamps null: false
    end
  end
end
