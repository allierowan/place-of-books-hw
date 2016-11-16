class ChangeDueDateDefaultBackReservation < ActiveRecord::Migration[5.0]
  def change
    change_column_default :reservations, :due_date, from: Date.today + 5, to: nil
  end
end
