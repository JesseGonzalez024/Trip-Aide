class AddColumnToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :depart_date, :string
  end
end
