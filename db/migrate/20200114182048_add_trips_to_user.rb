class AddTripsToUser < ActiveRecord::Migration
  def change
    add_column :users, :trips, :string
  end
end
