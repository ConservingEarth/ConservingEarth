class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :post
      t.references :video
      t.references :user
    end
  end
end
