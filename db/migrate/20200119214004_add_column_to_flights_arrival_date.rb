class AddColumnToFlightsArrivalDate < ActiveRecord::Migration
  def change
    add_column :flights, :arrival_date, :string
  end
end
