class AddLatitudeAndLongitudeToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :latitude, :float
    add_column :groups, :longitude, :float
    add_column :groups, :address, :string
  end
end
