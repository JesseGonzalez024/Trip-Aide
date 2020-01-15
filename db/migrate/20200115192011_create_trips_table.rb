class CreateTripsTable < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :destination
      t.string :start_date
      t.string :end_date
    end
  end
end
