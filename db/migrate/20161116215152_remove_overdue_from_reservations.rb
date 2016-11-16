class RemoveOverdueFromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :overdue, :boolean
  end
end
