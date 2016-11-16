class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :book_id
      t.string :name
      t.date :due_date
      t.boolean :overdue

      t.timestamps
    end
  end
end
