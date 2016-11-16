class AddReturnedAtToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :returned_at, :date
  end
end
