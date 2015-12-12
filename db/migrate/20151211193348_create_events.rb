class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :published
      t.text :email_info
      t.integer :capacity
      t.boolean :announced

      t.timestamps null: false
    end
  end
end
