class CreateFlightsTable < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :airline
      t.string :confirmation
      t.string :seat
      t.string :depart_time
      t.string :depart_from
      t.string :arrival_time
      t.string :arrival_to
      t.integer :trips_id
    end
  end
end
