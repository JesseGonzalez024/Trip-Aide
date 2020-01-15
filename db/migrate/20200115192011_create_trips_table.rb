class CreateTripsTable < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :destination
      t.string :dates
    end
  end
end
