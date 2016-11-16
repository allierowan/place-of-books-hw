class ChangeDueDateDefaultReservation < ActiveRecord::Migration[5.0]
  def change
    change_column_default :reservations, :due_date, from: nil, to: Date.today + 5
  end
end
